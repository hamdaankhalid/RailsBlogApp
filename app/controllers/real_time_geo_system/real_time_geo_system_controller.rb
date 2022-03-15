# frozen_string_literal: true

module RealTimeGeoSystem
  class RealTimeGeoSystemController < ApplicationController
    def index
      # this is where a querier will be given a url that they can share with their friends
      # they will also get a link to go to the querier panel, where they can monitor live
      # location of the people they share their link with in real time
      # create a dynamic querier id that will be used to share with others
      querier_id = SecureRandom.uuid
      @url_for_queriables = "http://localhost:3000/real_time_geo_system/#{querier_id}" # TODO: change urls in prod
      @url_for_querier = "http://localhost:3000/real_time_geo_system/querier_panel/#{querier_id}"
    end

    def show
      # this page has an id. the ID corresponds to a querier ID.
    end

    def querier_panel
      # this page has an id. This page is where a querier can see all the people's locations
    end
  end
end
