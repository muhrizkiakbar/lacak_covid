class CreateMainPersonalProtectiveEquipments < ActiveRecord::Migration[5.2]
  def change
    create_table :main_personal_protective_equipments do |t|
      t.string :personal_protective_equipment

      t.timestamps
    end
  end
end
