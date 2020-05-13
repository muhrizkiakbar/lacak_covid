class AddDeletedAtToMainDistrict < ActiveRecord::Migration[5.2]
  def change
    add_column :main_districts, :deleted_at, :datetime
    add_index :main_districts, :deleted_at
  end
end
