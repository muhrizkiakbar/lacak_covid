class AddSlugToMainPersonalProtectiveEquipment < ActiveRecord::Migration[5.2]
  def change
    add_column :main_personal_protective_equipments, :slug, :string
    add_index :main_personal_protective_equipments, :slug, unique: true
  end
end
