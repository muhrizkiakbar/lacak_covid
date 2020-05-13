class AddDeletedAtToMainCity < ActiveRecord::Migration[5.2]
  def change
    add_column :main_cities, :deleted_at, :datetime
    add_index :main_cities, :deleted_at
  end
end
