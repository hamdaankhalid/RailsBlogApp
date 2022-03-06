class SchedulePostJob < ApplicationJob
  queue_as :default

  def perform(linkedin_schedule_id)
    # Do something later
    linkedin_schedule = Internal::LinkedinScheduler.find(linkedin_schedule_id)
    if linkedin_schedule.created_at == linkedin_schedule.updated_at
      url = build_url(linkedin_schedule.id)
      Internal::LinkedinClientService.new.share_article(linkedin_schedule.post_body, url)
      linkedin_schedule.update(sent: true)
    end
  end

  private

  build_url(id)
    "https://hamdaan-rails-personal.herokuapp.com/articles/#{id}"
  end
end
