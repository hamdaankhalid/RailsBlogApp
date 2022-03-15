# frozen_string_literal: true

module RealTimeGeoSystem
  class RealTimeGeoSystemChannel < ApplicationCable::Channel
    def subscribed
      Rails.logger.debug 'subscribed'
      # _#{params[:querier_id]}
      stream_from 'real_time_geo_system_channel'
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end

    def query(data)
      # websocket event invoked by querier that sends query and we call the data store service to query
      Rails.logger.debug data['querier_id']
      # our redis geo db and return
    end

    def send_location_to_server(data)
      # a queriable sends this to server along with the querier_id
    end
  end
end
