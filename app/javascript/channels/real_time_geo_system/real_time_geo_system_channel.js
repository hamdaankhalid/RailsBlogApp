import consumer from "../consumer";

const GEO_SYSTEM_PATHS = [
  new URLPattern({ pathname: "/real_time_geo_system/:id" }),
  new URLPattern({ pathname: "/real_time_geo_system/querier_panel/:id" }),
];

const QUERIABLE_PAGE = "queriable";
const QUERIER = "querier";

// Used by queriables page
let latitudeDiv;
let longitudeDiv;
let trackingSwitch;
let channelId;
let queriableId;
let trackMe = {
  val: false,
  observers: [],
  set(x) {
    this.val = x;
    this.notify();
  },
  notify() {
    this.observers.forEach((x) => x.notify());
  },
};

// Used by queriers page
let trackQueriables = false;
let querySwitch;
let radiusInput;
let unitInput;
let resultsTable;

document.addEventListener("turbolinks:load", function () {
  let page;
  let currentPath = window.location;

  if (!isPathMatch(currentPath)) {
    return;
  } else {
    page = GEO_SYSTEM_PATHS[0].test(currentPath) ? QUERIABLE_PAGE : QUERIER;
  }

  if (page === QUERIABLE_PAGE) {
    referQueriablePageElements();
    instantiateQueriablePage();
  }

  if (page === QUERIER) {
    referQuerierPageElements();
    instantiateQuerierPage();
  }

  /***** WEB SOCKET LOGIC *************/
  const realTimeGeoSystem = consumer.subscriptions.create({
    channel: "RealTimeGeoSystem::RealTimeGeoSystemChannel",
    id: channelId
  },
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        switch (data.event_type) {
          case "queriable_data_updated":
            // if we are on query panel page we should react to this event
            if(page === QUERIER && trackQueriables) {
              this.query();
            }
            break;
          case "results_for_query":
            if(page === QUERIER && trackQueriables) {
              updateQueryView(data);
            }
            break;
          default:
            break;
        }
      },

      query() {
        navigator.geolocation.getCurrentPosition((pos) => {
          this.perform("query", { querier_id: channelId, longitude: pos.coords.longitude, latitude: pos.coords.latitude, radius: radiusInput.value, unit: unitInput.value});
        }, (err) => alert(err));
      },

      sendLocation(data) {
        this.perform("send_location_to_server", {
          latitude: data.latitude,
          longitude: data.longitude,
          querier_id: channelId,
          queriable_id: queriableId.textContent,
        });
      },
    }
  );
  
  // Querier_Panel
  function referQuerierPageElements() {
    querySwitch = document.getElementById("querySwitch");
    radiusInput = document.getElementById("radius");
    unitInput = document.getElementById("unit");
    resultsTable = document.getElementById("results");
  }

  function instantiateQuerierPage() {
    querySwitch.addEventListener("click", () => {
      trackQueriables = !trackQueriables;
      if(trackQueriables) {
        // make the intial query after which the websocket will handle real time querying on ueeriables updates
        realTimeGeoSystem.query();
      }
      querySwitch.style.color = trackQueriables ? "red" : "green";
      querySwitch.textContent = trackQueriables ? "Stop Live Querying" : "Start Live Querying";
    });
    channelId = String(currentPath).split("/")[5];
  }

  function updateQueryView(data) {
    console.log(data);
    // redraw table
    resultsTable.innerHTML = "";
    for (let [queriableId, distanceFromMe, longLat] of data.query_result) {
      const lonLat = `${longLat[0]}, ${longLat[1]}`;
      const row = resultsTable.insertRow(resultsTable.rows.length);
      const cell1 = row.insertCell(0);
      const cell2 = row.insertCell(1);
      const cell3 = row.insertCell(2);
      cell1.innerHTML = queriableId;
      cell2.innerHTML = distanceFromMe;
      cell3.innerHTML = lonLat;
    }
  }

  
  // Queriable_Panel
  function referQueriablePageElements() {
    latitudeDiv = document.getElementById("latitude");
    longitudeDiv = document.getElementById("longitude");
    trackingSwitch = document.getElementById("trackingSwitch");
    queriableId = document.getElementById("queriableId");
  }

  function instantiateQueriablePage() {
    trackingSwitch.addEventListener("click", () => {
      trackMe.set(!trackMe.val);
      const buttonText = trackMe.val ? "Stop Tracking Me" : "Start Tracking Me";
      const buttonColor = trackMe.val ? "red" : "green";
      trackingSwitch.textContent = buttonText;
      trackingSwitch.style.color = buttonColor;
    });
    trackMe.observers.push(observeTrackMe());
    channelId = String(currentPath).split("/")[4];
  }

  function observeTrackMe() {
    return {
      id: null,
      notify() {
        if (trackMe.val) {
          this.id = navigator.geolocation.watchPosition((x) => {
            notifyServerOfLocationUpdateAndUpdateView(x)
          }, (err) => alert(err));
        } else {
          navigator.geolocation.clearWatch(this.id);
        }
      },
    };
  }

  function notifyServerOfLocationUpdateAndUpdateView(coordinates) {
    const { latitude, longitude } = coordinates.coords;
    realTimeGeoSystem.sendLocation({ latitude, longitude });
    updateQueriableView(latitude, longitude);
  }

  function updateQueriableView(latitude, longitude) {
    latitudeDiv.textContent = latitude;
    longitudeDiv.textContent = longitude;
  }

  // Helper used for defining which pages to intialize the websocket connections on, with wildcard matching for id
  function isPathMatch(path) {
    for (let pattern of GEO_SYSTEM_PATHS) {
      if (pattern.test(path)) {
        return true;
      }
    }
    return false;
  }
});
