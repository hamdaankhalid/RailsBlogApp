# frozen_string_literal: true

module Internal
  class LinkedinSchedulersController < InheritedResources::Base
    def index
      @internal_linkedin_schedulers = LinkedinScheduler.all.order(schedule_for: :desc)
    end

    def new
      @internal_linkedin_scheduler = LinkedinScheduler.new
    end

    def create
      create_and_enqueue_post(linkedin_scheduler_params)
      redirect_to internal_linkedin_schedulers_path
    end

    def show
      @internal_linkedin_scheduler = LinkedinScheduler.find(params[:id])
    end

    def edit
      @internal_linkedin_scheduler = LinkedinScheduler.find(params[:id])
      redirect_if_already_sent(@internal_linkedin_scheduler)
    end

    def update
      # cant update if sent
      # invalidate job by deleteing from db, this will cause silent fail by deserialization error in worker
      redirect_or_delete(params[:id])
      create_and_enqueue_post(linkedin_scheduler_params)
      redirect_to internal_linkedin_schedulers_path
    end

    def destroy
      # cant destroy if sent
      redirect_or_delete(params[:id])
      # the job will fail if it was previously set since there will be deserialization error
      redirect_to internal_linkedin_schedulers_path
    end

    private

    def redirect_or_delete(id)
      redirect_if_already_sent(LinkedinScheduler.find(id))
      LinkedinScheduler.destroy(id)
    end

    def redirect_if_already_sent(schedule)
      if schedule.sent
        redirect_to internal_linkedin_schedulers_path
      end
    end

    def create_and_enqueue_post(linkedin_scheduler_params)
      linkedinSchedule = LinkedinScheduler.create!(linkedin_scheduler_params)
      puts "HEYYYO #{linkedinSchedule.id}"
      # Time.zone = "Pacific Time (US & Canada)"
      schedule_for_utc = linkedinSchedule.schedule_for.utc
      SchedulePostJob.set(wait_until: schedule_for_utc).perform_later(linkedinSchedule.id)
    end

    def linkedin_scheduler_params
      params.require(:internal_linkedin_scheduler).permit(:article_id, :post_body, :schedule_for)
    end
  end
end
