# frozen_string_literal: true

require 'rails_helper'

describe GeoDataGod::GeoQueryService do
  # mock this out and use a double
  let(:geohash_service) { GeoDataGod::GeohashService.new }

  describe 'prefix' do
    it 'returns an geohash prefix' do
      prefix = described_class.new(geohash_service).prefix(12, 21, 6)

      expect(prefix).to eq('s6numb')
    end
  end
end
