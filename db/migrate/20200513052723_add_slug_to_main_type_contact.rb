class AddSlugToMainTypeContact < ActiveRecord::Migration[5.2]
  def change
    add_column :main_type_contacts, :slug, :string
    add_index :main_type_contacts, :slug, unique: true
  end
end
