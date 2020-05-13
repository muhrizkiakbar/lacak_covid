class CreateMainDinkesRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :main_dinkes_regions do |t|
      t.string :dinkes_region
      t.references :main_dinkes_province, foreign_key: true

      t.timestamps
    end
  end
end
