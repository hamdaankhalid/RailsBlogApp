# frozen_string_literal: true

module RealTimeGeoSystem
  class RealTimeGeoSystemController < ApplicationController
    def index
      # this is where a querier will be given a url that they can share with their friends
      # they will also get a link to go to the querier panel, where they can monitor live
      # location of the people they share their link with in real time
    end

    def show; end

    def querier_panel; end
  end
end
