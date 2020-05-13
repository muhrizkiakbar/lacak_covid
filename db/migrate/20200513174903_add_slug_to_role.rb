class AddSlugToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :slug, :string
    add_index :roles, :slug, unique: true
  end
end
