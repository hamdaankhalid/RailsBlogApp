class CreateInternalLinkedinSchedulers < ActiveRecord::Migration[6.1]
  def change
    create_table :internal_linkedin_schedulers do |t|
      t.timestamp :schedule_for
      t.text :post_body
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
