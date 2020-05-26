class AddIsDinkesRegionToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :is_dinkes_region, :boolean
  end
end
