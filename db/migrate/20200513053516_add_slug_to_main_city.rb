class AddSlugToMainCity < ActiveRecord::Migration[5.2]
  def change
    add_column :main_cities, :slug, :string
    add_index :main_cities, :slug, unique: true
  end
end
