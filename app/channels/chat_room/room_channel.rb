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
      message_body = data['content']
      author = data['author']
      # save data to table and broadcast
      sj = Swearjar.default
      return if sj.profane?(message_body) || sj.profane?(author)

      Message.create!(content: message_body, author: author)
      ActionCable.server.broadcast 'room_channel', data
    end
  end
end
