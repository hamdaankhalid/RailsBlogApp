# frozen_string_literal: true

class ChangeAdminsToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_table :admins, :users
  end
end
