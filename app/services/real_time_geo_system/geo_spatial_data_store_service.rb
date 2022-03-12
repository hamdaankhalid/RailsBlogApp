# frozen_string_literal: true

module RealTimeGeoSystem
  class GeoSpatialDataStoreService
    def intialize(db)
      @db = db
    end

    def insert(param_object)
      @db.geoadd(param_object)
    end

    def query(query_object)
      @db.georadius(query)
    end
  end
end
