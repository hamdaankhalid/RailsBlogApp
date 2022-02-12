# frozen_string_literal: true

class Subscription < ApplicationRecord
  validates :email, uniqueness: true, presence: true
end
