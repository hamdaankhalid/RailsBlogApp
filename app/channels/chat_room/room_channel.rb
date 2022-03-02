# frozen_string_literal: true

module ChatRoom
  class RoomChannel < ApplicationCable::Channel
    def subscribed
      stream_from 'room_channel'
    end

    def unsubscribed
      # Any cleanup needed when channel is unsubscribed
    end

    def speak(data)
      # save data to table and broadcast
      Message.create!(content: data['content'], author: data['author'])
      ActionCable.server.broadcast 'room_channel', data
    end
  end
end
