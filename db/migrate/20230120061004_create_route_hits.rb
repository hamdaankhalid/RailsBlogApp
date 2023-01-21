class CreateRouteHits < ActiveRecord::Migration[6.1]
  def change
    create_table :route_hits do |t|
      t.string :route

      t.timestamps
    end
  end
end
