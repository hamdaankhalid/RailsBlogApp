# frozen_string_literal: true

# given a query, find the right prefix
module GeoDataGod
  class GeoQueryService
    def prefix(_lat, _long, _radius)
      # figure out the precision needed to encode based on radius
      # return that return prefix
      ''
    end

    private

    def precision(_radius)
    end
  end
end
