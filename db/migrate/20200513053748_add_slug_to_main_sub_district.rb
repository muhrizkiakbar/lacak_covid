class AddSlugToMainSubDistrict < ActiveRecord::Migration[5.2]
  def change
    add_column :main_sub_districts, :slug, :string
    add_index :main_sub_districts, :slug, unique: true
  end
end
