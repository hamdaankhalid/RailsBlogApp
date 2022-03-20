# frozen_string_literal: true

module RealTimeGeoSystem
  class RealTimeGeoSystemChannel < ApplicationCable::Channel
    def initialize(connection, identifier, params)
      super(connection, identifier, params)
      redis_connection = Factories::RedisFactory.create
      @geo_spatial_data_store_service = RealTimeGeoSystem::GeoSpatialDataStoreService.new(redis_connection)
    end

    def subscribed
      stream_from "real_time_geo_system_channel_#{params[:id]}"
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end

    def query(data)
      # websocket event invoked by querier that sends query and we call the data store service to query
      results = @geo_spatial_data_store_service.query(
        querier_id: data['querier_id'], longitude: data['longitude'],
        latitude: data['latitude'], radius: data['radius'],
        unit: data['unit'], limit: 10
      )
      ActionCable.server.broadcast "real_time_geo_system_channel_#{params[:id]}",
                                   { event_type: 'results_for_query', query_result: results }
    end

    def send_location_to_server(data)
      @geo_spatial_data_store_service.add(
        querier_id: data['querier_id'], latitude: data['latitude'],
        longitude: data['longitude'], queriable_id: data['queriable_id']
      )
      ActionCable.server.broadcast "real_time_geo_system_channel_#{params[:id]}",
                                   { event_type: 'queriable_data_updated' }
    end
  end
end
