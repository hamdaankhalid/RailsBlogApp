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
      LinkedinScheduler.create!(linkedin_scheduler_params)
      redirect_to internal_linkedin_schedulers_path
    end

    def show
      @internal_linkedin_scheduler = LinkedinScheduler.find(params[:id])
    end

    # this gets the edit page, update action is handled by rails 6 by default
    def edit
      @internal_linkedin_scheduler = LinkedinScheduler.find(params[:id])
    end

    def destroy
      LinkedinScheduler.destroy(params[:id])
      redirect_to internal_linkedin_schedulers_path
    end

    private

    def linkedin_scheduler_params
      params.require(:internal_linkedin_scheduler).permit(:article_id, :post_body, :schedule_for)
    end
  end
end
