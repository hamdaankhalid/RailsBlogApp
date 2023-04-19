class CreateCodeReminderCodeReminders < ActiveRecord::Migration[6.1]
  def change
    create_table :code_reminder_code_reminders do |t|
      t.string :email
      t.integer :cadence
      t.integer :cadence_unit

      t.timestamps
    end
  end
end
