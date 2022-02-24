# frozen_string_literal: true

module GeoDataGod
  class GeoQueryService
    def initialize(geohash_service)
      @geohash_service = geohash_service
    end

    def prefix(lat, long, radius)
      # figure out the precision needed to encode based on radius
      precision_value = precision(radius)
      @geohash_service.encode(lat, long, precision_value)
    end

    private

    def precision(_radius)
      # based on radius we decide precision
      6
    end
  end
end
