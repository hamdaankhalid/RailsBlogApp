# frozen_string_literal: true

module ChatRoom
  class RoomsController < ApplicationController
    def show
      @messages = Message.all
    end
  end
end
