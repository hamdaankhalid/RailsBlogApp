# frozen_string_literal: true

require 'swearjar'

class ModerateCommentJob < ApplicationJob
  queue_as :default

  def perform(comment)
    sj = Swearjar.default
    comment.update("status": 'public') unless sj.profane?(comment.body) || sj.profane?(comment.commenter)
  end
end
