class NotifyArticlePublishedMailer < ApplicationMailer
    def notify
        @email = params[:email]
        @article = params[:article]
        puts root_url
        @url = "#{root_url}articles/#{@article.id}"
        mail(to: @email, subject: "Read my latest Engineering article #{@article.title}")
    end
end
