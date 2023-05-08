# frozen_string_literal: true

class CodeReminderCadenceJob < ApplicationJob
  queue_as :default

  def perform(code_reminder_id)
    code_reminder = CodeReminder.find(code_reminder_id)
    token_gen = TokenChecker.new
    question_lang_generator = CodeReminder::RandomQuestionLanguageGen.new

    access_token = token_gen.generate_token(code_reminder.email, 100_000)
    edit_link = "https://hamdaan-rails-personal.herokuapp.com/code_reminders/#{code_reminder_id}/edit?token=#{access_token}"
    CodeReminderMailer.with(
      question_link: question_lang_generator.question_link,
      language: question_lang_generator.language,
      edit_code_reminder_link: edit_link,
      email: code_reminder.email
    ).code_reminder_mail.deliver_now

    CodeReminderCadenceJob.set(
      wait_until: next_reminder(code_reminder.cadence, code_reminder.cadence_unit)
    ).perform_later(code_reminder_id)
  rescue ActiveRecord::RecordNotFound
    logger.info("Code Reminder with id #{code_reminder_id} not found")
  end

  private

  def next_reminder(cadence, cadence_unit)
    logger.info("Cadence Unit #{cadence_unit}")
    case cadence_unit
    when "days"
      offset_in_seconds = cadence * 24 * 60 * 60
    when "weeks"
      offset_in_seconds = cadence * 7 * 24 * 60 * 60
    when "months"
      offset_in_seconds = cadence * 30 * 24 * 60 * 60
    else
      puts "Cadence switch case errored with: #{cadence}, #{cadence_unit}"
      raise ArgumentError, 'Invalid cadence_unit. Must be :days, :weeks, or :months'
    end
    Time.now.utc + offset_in_seconds
  end
end
