class CreateMainDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :main_districts do |t|
      t.string :district
      t.references :main_city, foreign_key: true

      t.timestamps
    end
  end
end
