# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RealTimeGeoSystem::GeoSpatialDataStoreService do
  describe 'insert' do
    it 'inserts valid data' do
      data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new
      data_store.insert
    end
  end

  describe 'query' do
    it 'queries' do
      data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new
      data_store.query
    end
  end
end
