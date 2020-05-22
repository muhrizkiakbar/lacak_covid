class AddDeletedAtToLSixFHospitalDest < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_f_hospital_dests, :deleted_at, :datetime
    add_index :l_six_f_hospital_dests, :deleted_at
  end
end
