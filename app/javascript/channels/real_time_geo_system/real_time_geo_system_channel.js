import consumer from "../consumer";

const GEO_SYSTEM_PATHS = [
  new URLPattern({ pathname: "/real_time_geo_system/:id" }),
  new URLSearchParams({ pathname: "/real_time_geo_system/querier_panel/:id" }),
];

document.addEventListener("turbolinks:load", function () {
  if (!isPathMatch(window.location.pathname)) {
    return;
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

      sendLocation() {
        // used by a queriable on location update to hit the server with their current location
      },
    }
  );

  // Querier_Panel
  function startQuerying() {
    // takes data from form and invokes a method
  }

  function updateQueryPanel() {
    // display changes on UI
  }

  // Queriables
  function startTracking() {
    // send data to realTimeGeoSystem subscription every time location updates
  }

  function stopTracking() {
    // terminate realTimeGeoSystem subscription
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
