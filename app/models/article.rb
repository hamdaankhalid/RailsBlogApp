# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible

  has_rich_text :content
  has_many :comments, dependent: :destroy
  has_many :internal_linkedin_schedulers, dependent: :destroy, class_name: 'Internal::LinkedinScheduler'
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  after_save :notify_subscribers

  private

  def notify_subscribers
    NotifySubscribersJob.perform_later self if status == 'public' && created_at == updated_at
  end
end
