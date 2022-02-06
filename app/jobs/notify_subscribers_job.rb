class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(article)
    Subscription.all.each do |subscriber|
      NotifyArticlePublishedMailer.with(email: subscriber.email, article: article).notify.deliver_later
    end
  end
end
