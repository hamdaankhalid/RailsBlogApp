# frozen_string_literal: true

class NotifyArticlePublishedMailer < ApplicationMailer
  def notify
    @email = params[:email]
    @article = params[:article]
    Rails.logger.debug root_url
    @url = "https://hamdaan-rails-personal.herokuapp.com/articles/#{@article.id}"
    mail(to: @email, subject: "Read my latest Engineering article #{@article.title}")
  end
end
