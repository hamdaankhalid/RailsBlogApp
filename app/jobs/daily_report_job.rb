class DailyReportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    report =  RouteHit.group(:route).count
    today = Date.today
    AdminUser.all.each do |admin_user|
      DailyReportMailer.with(routes_hit: report, email: admin_user.email, report_date: today).report.deliver_now
    end
    RouteHit.destroy_all
  end
end
