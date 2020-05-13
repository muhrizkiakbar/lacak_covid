class AddSlugToMainDistrict < ActiveRecord::Migration[5.2]
  def change
    add_column :main_districts, :slug, :string
    add_index :main_districts, :slug, unique: true
  end
end
