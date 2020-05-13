class RemoveHospitalFromMainPublicHealthCenter < ActiveRecord::Migration[5.2]
  def change
    remove_reference :main_public_health_centers, :main_hospital, foreign_key: true
  end
end
