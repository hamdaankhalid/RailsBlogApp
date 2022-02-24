# frozen_string_literal: true

class MakeEmailUniqueInSubscription < ActiveRecord::Migration[6.1]
  def change
    add_index :subscriptions, :email, unique: true
  end
end
