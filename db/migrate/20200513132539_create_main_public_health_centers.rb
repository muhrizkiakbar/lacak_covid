class CreateMainPublicHealthCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :main_public_health_centers do |t|
      t.string :public_health_center
      t.references :main_hospital, foreign_key: true

      t.timestamps
    end
  end
end
