class AddDeletedAtToMainPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :main_patients, :deleted_at, :datetime
    add_index :main_patients, :deleted_at
  end
end
