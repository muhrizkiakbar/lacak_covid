class AddIsShowAllToRole < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :is_show_to_all, :boolean
  end
end
