import consumer from "../consumer";

const GEO_SYSTEM_PATHS = [
  new URLPattern({ pathname: "/real_time_geo_system/:id" }),
  new URLPattern({ pathname: "/real_time_geo_system/querier_panel/:id" }),
];

const QUERIABLE_PAGE = "queriable";
const QUERIER = "querier";

// elements used by queriables page
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
  }

  const realTimeGeoSystem = consumer.subscriptions.create(
    "RealTimeGeoSystem::RealTimeGeoSystemChannel",
    {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        // if data is recieved is for querier panel go ahead and updateQueryPanel
        // ignore data for querier panel unless querier has turned on the flag
      },

      query() {
        this.perform("query", { querier_id: "DATA BEING SENT" });
      },

      sendLocation(data) {
        this.perform("send_location_to_server", {
          latitude: data.latitude,
          longitude: data.longitude,
          querier_id: channelId,
          queriable_id: queriableId.textContent,
        });
      },
    },
    channelId
  );

  // Querier_Panel
  function startQuerying() {
    // takes data from form and invokes a method
  }

  function updateQueryPanel() {
    // display changes on UI
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
          // attach event listener on location update
          this.id = navigator.geolocation.watchPosition((x) =>
            notifyServerOfLocationUpdateAndUpdateView(x)
          );
        } else {
          // detach event listener on location update
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

  function referQuerierPageElements() {
    // to be implemented
  }
});
