class AddIsPublicHealthCenterToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :is_public_health_center, :boolean
  end
end
