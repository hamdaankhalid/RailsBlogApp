# frozen_string_literal: true

module RealTimeGeoSystem
  class RealTimeGeoSystemChannel < ApplicationCable::Channel
    def initialize(connection, identifier, params)
      super(connection, identifier, params)
      redis_connection = Factories::RedisFactory.create
      @geo_spatial_data_store_service = RealTimeGeoSystem::GeoSpatialDataStoreService.new(redis_connection)
    end

    def subscribed
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
      @geo_spatial_data_store_service.add(
        querier_id: data['querier_id'], latitude: data['latitude'],
        longitude: data['longitude'], queriable_id: data['queriable_id']
      )
    end
  end
end
