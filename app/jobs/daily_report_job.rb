class DailyReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    generate_report
    send_email
    # Clear the table :)
    RouteHit.destroy_all
  end

  private

  def generate_report
    @route_to_hit = []
    # for all distinct routes in RouteHit table
    # filter and gather those that are index based
    # keep the rest as is
    # put together a list of route and hit counts
    
    @hits_by_hour = []
    # group the hits by the hours they were made
  end

  def send_email
  end
end