class AddUniqueConstraintToCodeReminder < ActiveRecord::Migration[6.1]
  def change
    change_column_null :code_reminders, :email, false
    add_index :code_reminders, :email, unique: true
  end
end
