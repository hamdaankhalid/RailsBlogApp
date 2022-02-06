class WelcomeSubscriptionMailer < ApplicationMailer
    def welcome
        @url = "http://localhost:3000/articles" # pull the base for the url from envvar
        mail(to: params[:email], subject: "Thank you for subscribing to Hamdaan Khalid Engineering!")
    end
end
