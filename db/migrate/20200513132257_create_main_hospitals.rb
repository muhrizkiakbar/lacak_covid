class CreateMainHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :main_hospitals do |t|
      t.string :hospital
      t.boolean :is_primary
      t.references :main_dinkes_region, foreign_key: true

      t.timestamps
    end
  end
end
