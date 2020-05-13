class AddDeletedAtToMainPublicHealthCenter < ActiveRecord::Migration[5.2]
  def change
    add_column :main_public_health_centers, :deleted_at, :datetime
    add_index :main_public_health_centers, :deleted_at
  end
end
