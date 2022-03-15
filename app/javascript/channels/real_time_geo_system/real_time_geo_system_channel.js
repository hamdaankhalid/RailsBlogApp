import consumer from "../consumer"

const GEO_SYSTEM_PATH = '/real_time_geo_system';

document.addEventListener("turbolinks:load", function () {
  if (window.location.pathname !== GEO_SYSTEM_PATH) {
    return;
  }

  consumer.subscriptions.create("RealTimeGeoSystem::RealTimeGeoSystemChannel", {
    connected() {
      this.perform('query',{querier_id: "DATA BEING SENT" });
      // Called when the subscription is ready for use on the server
    },
  
    disconnected() {
      // Called when the subscription has been terminated by the server
    },
  
    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log(data);
    }
  });  
});
