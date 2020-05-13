class CreateMainCitizenAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :main_citizen_associations do |t|
      t.string :citizen_association
      t.references :main_sub_district, foreign_key: true

      t.timestamps
    end
  end
end
