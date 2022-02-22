# frozen_string_literal: true

require 'rails_helper'

describe GeoDataGod::GeoQueryService do
  describe 'prefix' do
    it 'returns an geohash prefix' do
      prefix = GeoDataGod::GeoQueryService.new.prefix(12, 21, 6)

      expect(prefix).to eq('')
    end
  end
end
