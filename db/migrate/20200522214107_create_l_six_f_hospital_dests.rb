class CreateLSixFHospitalDests < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_f_hospital_dests do |t|
      t.references :l_six_fourth, foreign_key: true
      t.string :hospital
      t.string :city
      t.date :visit_date
      t.string :province_city

      t.timestamps
    end
  end
end
