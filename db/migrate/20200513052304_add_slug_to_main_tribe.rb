class AddSlugToMainTribe < ActiveRecord::Migration[5.2]
  def change
    add_column :main_tribes, :slug, :string
    add_index :main_tribes, :slug, unique: true
  end
end
