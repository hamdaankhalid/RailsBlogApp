class CodeReminderMailer < ApplicationMailer
  def code_reminder_mail
    @question_link = params[:question_link]
    @language = params[:language]
    @edit_code_reminder_link = params[:edit_code_reminder_link]
    mail(to: params[:email], subject: 'Your Code Reminder is here')
  end
end
