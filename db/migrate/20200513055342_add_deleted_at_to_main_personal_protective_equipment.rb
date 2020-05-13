class AddDeletedAtToMainPersonalProtectiveEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :main_personal_protective_equipments, :deleted_at, :datetime
    add_index :main_personal_protective_equipments, :deleted_at
  end
end
