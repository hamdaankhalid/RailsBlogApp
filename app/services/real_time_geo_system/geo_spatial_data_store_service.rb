# frozen_string_literal: true

module RealTimeGeoSystem
  class GeoSpatialDataStoreService
    def initialize(db)
      @db = db
    end

    def insert(params)
      validate_insert(params)
      @db.geoadd(params[:querier_id], [params[:latitude], params[:longitude], params[:queriable_id]])
    end

    def query(query_object)
      puts query_object
      #@db.georadius(query)
    end

    private

    def validate_insert(params)
      raise ArgumentError, 'Argument hash must contain querier_id, latitude, longitude, and queriable_id keys' unless params.has_key?(:querier_id) &&  params.has_key?(:latitude) &&  params.has_key?(:longitude) &&  params.has_key?(:queriable_id)
    end
  end
end
