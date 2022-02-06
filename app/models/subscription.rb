class Subscription < ApplicationRecord
    validates :email, uniqueness: true, presence: true
end
