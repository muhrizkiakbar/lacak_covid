class AddDeletedAtToMainCitizenAssociation < ActiveRecord::Migration[5.2]
  def change
    add_column :main_citizen_associations, :deleted_at, :datetime
    add_index :main_citizen_associations, :deleted_at
  end
end
