class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  after_save :notify_subscribers

  private
  def notify_subscribers
    if self.status == "public" && self.created_at == self.updated_at
      NotifySubscribersJob.perform_later self
    end
  end
end
