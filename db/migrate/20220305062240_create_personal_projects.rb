class CreatePersonalProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :personal_projects do |t|
      t.text :title
      t.text :description
      t.text :url

      t.timestamps
    end
  end
end
