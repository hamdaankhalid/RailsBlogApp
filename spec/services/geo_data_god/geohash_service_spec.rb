# frozen_string_literal: true

require 'rails_helper'

describe GeoDataGod::GeohashService do
  describe '.encode' do
    it 'returns an encoded coordiante' do
      geohash = GeoDataGod::GeohashService.new.encode(12, 21, 6)

      expect(geohash).to eq('s6numb')
    end
  end

  describe '.decode' do
    it 'returns lat and long after de-encoding' do
      decoded_geohash = GeoDataGod::GeohashService.new.decode('Zh3')
      expect(decoded_geohash).to eq([[68.90625, 136.40625], [70.3125, 137.8125]])
    end
  end
end
