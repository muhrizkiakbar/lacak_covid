class AddIsDinkesProvinceToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :is_dinkes_province, :boolean
  end
end
