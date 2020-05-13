class AddSlugToMainDinkesProvince < ActiveRecord::Migration[5.2]
  def change
    add_column :main_dinkes_provinces, :slug, :string
    add_index :main_dinkes_provinces, :slug, unique: true
  end
end
