class NotifyArticlePublishedMailer < ApplicationMailer
    def notify
        @email = params[:email]
        @article = params[:article]
        @url = "http://localhost:3000/articles/#{@article.id}"
        mail(to: @email, subject: "Read my latest Engineering article #{@article.title}")
    end
end
