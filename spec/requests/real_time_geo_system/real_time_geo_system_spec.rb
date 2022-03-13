# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'RealTimeGeoSystem::RealTimeGeoSystems', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/real_time_geo_system'
      expect(response).to have_http_status(:success)
    end
  end
end
