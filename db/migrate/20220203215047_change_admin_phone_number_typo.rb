# frozen_string_literal: true

class ChangeAdminPhoneNumberTypo < ActiveRecord::Migration[6.1]
  def change
    rename_column :admins, :phone_nuber, :phone_number
  end
end
