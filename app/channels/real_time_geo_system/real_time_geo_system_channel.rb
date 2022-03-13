class RealTimeGeoSystem::RealTimeGeoSystemChannel < ApplicationCable::Channel
  def subscribed
    puts 'subscribed'
    stream_from "real_time_geo_system_channel_#{params[:querier_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def query(data)
    #websocket event invoked by querier that sends query and we call the data store service to query
    puts data
    # our redis geo db and return
  end

  def send_location_to_server(data)
    # a queriable sends this to server along with the querier_id
  end
end
