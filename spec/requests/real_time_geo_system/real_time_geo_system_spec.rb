# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RealTimeGeoSystem::RealTimeGeoSystems', type: :request do
  describe 'GET /real_time_geo_system' do
    it 'returns http success' do
      get '/real_time_geo_system'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /real_time_geo_system/:id' do
    it 'returns http success' do
      get '/real_time_geo_system/1234'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /real_time_geo_system/querier_panel/:id' do
    it 'returns http success' do
      get '/real_time_geo_system/querier_panel/1234'
      expect(response).to have_http_status(:success)
    end
  end
end
