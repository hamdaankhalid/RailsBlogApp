# frozen_string_literal: true

require 'rails_helper'

describe GeoDataGod::GeohashService do
  describe '.encode' do
    it 'returns an authetication token' do
      geohash = GeoDataGod::GeohashService.new.encode('12', '21', '8')

      expect(geohash).to eq(%w[12 21 8])
    end
  end

  describe '.decode' do
    it 'returns account id after decoding token' do
      decoded_geohash = GeoDataGod::GeohashService.new.decode('Zh3')
      expect(decoded_geohash).to eq('Zh3')
    end
  end
end
