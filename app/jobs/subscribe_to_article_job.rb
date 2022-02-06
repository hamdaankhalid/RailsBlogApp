class SubscribeToArticleJob < ApplicationJob
  queue_as :default

  def perform(subscribed)
    WelcomeSubscriptionMailer.with(email: subscribed.email).welcome.deliver_now
  end
end
