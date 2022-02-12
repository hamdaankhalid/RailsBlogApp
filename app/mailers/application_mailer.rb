# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'khalid.hamdaan@gmail.com'
  layout 'mailer'
end
