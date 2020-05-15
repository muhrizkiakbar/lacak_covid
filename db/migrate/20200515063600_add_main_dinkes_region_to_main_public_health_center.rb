class AddMainDinkesRegionToMainPublicHealthCenter < ActiveRecord::Migration[5.2]
  def change
    add_reference :main_public_health_centers, :main_dinkes_region, foreign_key: true
  end
end
