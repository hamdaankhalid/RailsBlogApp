# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RealTimeGeoSystem::GeoSpatialDataStoreService do
  let(:test_client){ RedisFactory.create }

  before(:each) do
    test_client.flushall
  end
  describe 'insert' do
    it 'inserts data in geo db when valid params are passed' do
      data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new(test_client)
      response = data_store.insert({
        :querier_id => "1abcde",
        :queriable_id => "a",
        :longitude => 69,
        :latitude => 69
      })
      expect(response).to eq(1)
    end

    it 'throws argumet exception when in-valid params are passed' do
      data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new(test_client)
      expect { data_store.insert({
        :longitude => 69,
        :latitude => 69
      }) }.to raise_error(an_instance_of(ArgumentError))
    end
  end

  describe 'query' do
    it 'queries' do
      #data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new(MyRedisWrapper.Redis)
      #data_store.query
    end
  end
end
