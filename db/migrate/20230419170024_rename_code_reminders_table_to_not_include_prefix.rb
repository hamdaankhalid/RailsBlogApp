class RenameCodeRemindersTableToNotIncludePrefix < ActiveRecord::Migration[6.1]
  def change
    rename_table :code_reminder_code_reminders, :code_reminders
  end
end
