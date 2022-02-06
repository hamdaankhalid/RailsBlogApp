class AddOrderToExperiences < ActiveRecord::Migration[6.1]
  def change
    add_column :experiences, :order, :int
  end
end
