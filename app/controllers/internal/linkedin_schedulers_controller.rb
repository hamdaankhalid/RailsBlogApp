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
      redirect_or_delete(params[:id])
      create_and_enqueue_post(linkedin_scheduler_params)
      redirect_to internal_linkedin_schedulers_path
    end

    def destroy
      redirect_or_delete(params[:id])
      redirect_to internal_linkedin_schedulers_path
    end

    private

    def redirect_or_delete(id)
      redirect_if_already_sent(LinkedinScheduler.find(id))
      LinkedinScheduler.destroy(id)
    end

    def redirect_if_already_sent(schedule)
      redirect_to internal_linkedin_schedulers_path if schedule.sent
    end

    def create_and_enqueue_post(linkedin_scheduler_params)
      linkedin_schedule = LinkedinScheduler.create!(linkedin_scheduler_params)
      schedule_for_utc = linkedin_schedule.schedule_for.utc
      SchedulePostJob.set(wait_until: schedule_for_utc).perform_later(linkedin_schedule.id)
    end

    def linkedin_scheduler_params
      params.require(:internal_linkedin_scheduler).permit(:article_id, :post_body, :schedule_for)
    end
  end
end
