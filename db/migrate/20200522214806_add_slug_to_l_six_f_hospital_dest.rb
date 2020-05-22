class AddSlugToLSixFHospitalDest < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_f_hospital_dests, :slug, :string
    add_index :l_six_f_hospital_dests, :slug, unique: true
  end
end
