class AddSlugToMainPublicHealthCenter < ActiveRecord::Migration[5.2]
  def change
    add_column :main_public_health_centers, :slug, :string
    add_index :main_public_health_centers, :slug, unique: true
  end
end
