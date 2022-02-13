# frozen_string_literal: true

class WelcomeSubscriptionMailer < ApplicationMailer
  def welcome
    @url = 'https://hamdaan-rails-personal.herokuapp.com/articles'
    mail(to: params[:email], subject: 'Thank you for subscribing to Hamdaan Khalid Engineering!')
  end
end
