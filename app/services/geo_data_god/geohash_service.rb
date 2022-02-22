# frozen_string_literal: true

# Just a wrapper around the library
module GeoDataGod
  class GeohashService
    def encode(lat, long, precision)
      GeoHash.encode(lat, long, precision)
    end

    def decode(geohash)
      GeoHash.decode(geohash)
    end
  end
end
