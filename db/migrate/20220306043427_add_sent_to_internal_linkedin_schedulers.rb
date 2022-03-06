class AddSentToInternalLinkedinSchedulers < ActiveRecord::Migration[6.1]
  def change
    add_column :internal_linkedin_schedulers, :sent, :boolean, default: false
  end
end
