# frozen_string_literal: true

module RealTimeGeoSystem
  class RealTimeGeoSystemController < ApplicationController
    def index
      querier_id = SecureRandom.uuid
      @url_for_queriables = "#{ENV['BASE_URL']}/real_time_geo_system/#{querier_id}"
      @url_for_querier = "#{ENV['BASE_URL']}/real_time_geo_system/querier_panel/#{querier_id}"
    end

    def show
      @queriable_id = SecureRandom.uuid
    end

    def querier_panel
      @url_for_queriables = "#{ENV['BASE_URL']}/real_time_geo_system/#{params[:id]}"
    end
  end
end
