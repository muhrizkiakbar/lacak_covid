class CreateMainSetLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :main_set_locations do |t|
      t.string :set_location

      t.timestamps
    end
  end
end
