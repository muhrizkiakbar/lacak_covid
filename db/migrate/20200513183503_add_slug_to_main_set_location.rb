class AddSlugToMainSetLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :main_set_locations, :slug, :string
    add_index :main_set_locations, :slug, unique: true
  end
end
