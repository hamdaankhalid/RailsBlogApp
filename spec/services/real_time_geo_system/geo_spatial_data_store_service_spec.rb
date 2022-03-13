# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RealTimeGeoSystem::GeoSpatialDataStoreService do
  let(:test_client) { Factories::RedisFactory.create }

  before(:each) do
    test_client.flushall
  end

  describe 'add' do
    it 'adds data in geo db when valid params are passed' do
      data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new(test_client)
      response = data_store.add({
                                  querier_id: '1abcde',
                                  queriable_id: 'a',
                                  longitude: 69,
                                  latitude: 69
                                })
      expect(response).to eq(1)
    end

    it 'throws argumet exception when in-valid params are passed' do
      data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new(test_client)
      expect do
        data_store.add({
                         longitude: 69,
                         latitude: 69
                       })
      end.to raise_error(an_instance_of(ArgumentError))
    end
  end

  describe 'query' do
    it 'queries' do
      data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new(test_client)
      added = data_store.add({
                               querier_id: '1abcde',
                               queriable_id: 'a',
                               longitude: 69,
                               latitude: 69
                             })
      expect(added).to eq(1)
      query_result = data_store.query({
                                        longitude: 69,
                                        latitude: 69,
                                        radius: 4,
                                        limit: 1,
                                        unit: 'mi',
                                        querier_id: '1abcde'
                                      })
      expect(query_result).to eq([['a', '0.0001']])
    end

    it 'throws argumet exception when in-valid params are passed' do
      data_store = RealTimeGeoSystem::GeoSpatialDataStoreService.new(test_client)
      expect do
        data_store.query({
                           longitude: 69,
                           latitude: 69
                         })
      end.to raise_error(an_instance_of(ArgumentError))
    end
  end
end
