class AddSlugToMainProvince < ActiveRecord::Migration[5.2]
  def change
    add_column :main_provinces, :slug, :string
    add_index :main_provinces, :slug, unique: true
  end
end
