class AddDeletedAtToMainSubDistrict < ActiveRecord::Migration[5.2]
  def change
    add_column :main_sub_districts, :deleted_at, :datetime
    add_index :main_sub_districts, :deleted_at
  end
end
