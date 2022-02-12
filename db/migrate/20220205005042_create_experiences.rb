# frozen_string_literal: true

class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :organization
      t.string :title
      t.text :description
      t.string :started_at
      t.string :ended_at
      t.string :type

      t.timestamps
    end
  end
end
