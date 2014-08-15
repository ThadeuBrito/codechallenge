class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :origin_station_id
      t.string :destination_station_id
      t.string :line_id

      t.timestamps
    end
  end
end
