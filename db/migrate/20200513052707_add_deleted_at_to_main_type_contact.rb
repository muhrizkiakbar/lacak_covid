class AddDeletedAtToMainTypeContact < ActiveRecord::Migration[5.2]
  def change
    add_column :main_type_contacts, :deleted_at, :datetime
    add_index :main_type_contacts, :deleted_at
  end
end
