# frozen_string_literal: true

class SchedulePostJob < ApplicationJob
  queue_as :default

  def perform(id)
    linkedin_schedule = Internal::LinkedinScheduler.find(id)
    #return unless linkedin_schedule.created_at == linkedin_schedule.updated_at

    url = build_url(linkedin_schedule.article.id)
    li_client = Internal::LinkedinClientService.new(ENV['LI_TOKEN'])
    li_client.share_article(linkedin_schedule.article.title, linkedin_schedule.post_body, url)
    linkedin_schedule.update(sent: true)
  end

  private

  def build_url(id)
    "https://hamdaan-rails-personal.herokuapp.com/articles/#{id}"
  end
end
