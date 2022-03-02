class ChatRoom::RoomsController < ApplicationController
  def show
    @messages = Message.all
  end
end
