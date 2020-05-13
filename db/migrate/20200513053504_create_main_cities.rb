class CreateMainCities < ActiveRecord::Migration[5.2]
  def change
    create_table :main_cities do |t|
      t.string :city
      t.references :main_province, foreign_key: true

      t.timestamps
    end
  end
end
