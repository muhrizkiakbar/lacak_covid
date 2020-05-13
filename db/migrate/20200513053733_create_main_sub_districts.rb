class CreateMainSubDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :main_sub_districts do |t|
      t.string :sub_district
      t.references :main_district, foreign_key: true

      t.timestamps
    end
  end
end
