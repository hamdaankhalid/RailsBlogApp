class WelcomeSubscriptionMailer < ApplicationMailer
    def welcome
        @url = "#{root_url}articles"
        mail(to: params[:email], subject: "Thank you for subscribing to Hamdaan Khalid Engineering!")
    end
end
