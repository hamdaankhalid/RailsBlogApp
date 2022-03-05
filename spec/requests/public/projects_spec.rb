require 'rails_helper'

RSpec.describe "Public::Projects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/public/projects/index"
      expect(response).to have_http_status(:success)
    end
  end

end
