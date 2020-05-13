class AddDeletedAtToMainSetLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :main_set_locations, :deleted_at, :datetime
    add_index :main_set_locations, :deleted_at
  end
end
