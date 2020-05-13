class AddSlugToMainCitizenAssociation < ActiveRecord::Migration[5.2]
  def change
    add_column :main_citizen_associations, :slug, :string
    add_index :main_citizen_associations, :slug, unique: true
  end
end
