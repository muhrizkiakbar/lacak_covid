class AddDeletedAtToMainHospital < ActiveRecord::Migration[5.2]
  def change
    add_column :main_hospitals, :deleted_at, :datetime
    add_index :main_hospitals, :deleted_at
  end
end
