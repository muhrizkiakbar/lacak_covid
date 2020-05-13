class AddSlugToMainDinkesRegion < ActiveRecord::Migration[5.2]
  def change
    add_column :main_dinkes_regions, :slug, :string
    add_index :main_dinkes_regions, :slug, unique: true
  end
end
