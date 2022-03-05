# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Public::Projects', type: :request do
  describe 'GET /project' do
    it 'returns http success' do
      get '/projects'
      expect(response).to have_http_status(:success)
    end
  end
end
