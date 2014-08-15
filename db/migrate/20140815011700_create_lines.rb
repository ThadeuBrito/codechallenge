class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :name
      t.string :colour
      t.string :stripe

      t.timestamps
    end
  end
end
