class DailyReportMailer < ApplicationMailer
  def report
    @routes_hit = params[:routes_hit]
    @report_date = params[:date_today] # Date.today
    @email = params[:email]
    mail(to: @email, subject: "Your Daily Report for #{@report_date}")
  end
end
