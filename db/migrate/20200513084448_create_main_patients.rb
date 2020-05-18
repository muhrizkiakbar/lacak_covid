class CreateMainPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :main_patients do |t|
      t.references :main_city, foreign_key: true
      t.references :main_district, foreign_key: true
      t.references :main_sub_district, foreign_key: true
      t.references :main_citizen_association, foreign_key: true
      t.references :main_neighborhood_association, foreign_key: true
      t.references :main_marital_status, foreign_key: true
      t.string :no_identity
      t.string :name_of_parent
      t.string :name
      t.text :address
      t.string :phone_number
      t.date :date_of_birth
      t.integer :gender

      t.timestamps
    end
  end
end
