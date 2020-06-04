class CreateMainPhcOfSds < ActiveRecord::Migration[5.2]
  def change
    create_table :main_phc_of_sds do |t|
      t.references :main_public_health_center, foreign_key: true
      t.references :main_sub_district, foreign_key: true

      t.timestamps
    end
  end
end
