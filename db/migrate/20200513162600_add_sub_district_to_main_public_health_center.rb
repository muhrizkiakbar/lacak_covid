class AddSubDistrictToMainPublicHealthCenter < ActiveRecord::Migration[5.2]
  def change
    add_reference :main_public_health_centers, :main_sub_district, foreign_key: true
  end
end
