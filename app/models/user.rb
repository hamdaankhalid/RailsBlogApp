# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true
  validates :phone_number, presence: true
end
