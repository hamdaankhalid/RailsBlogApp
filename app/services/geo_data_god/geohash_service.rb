# frozen_string_literal: true

module GeoDataGod
  class GeohashService
    def encode(lat, long, precision)
      [lat, long, precision]
    end

    def decode(geohash)
      geohash
    end
  end
end
