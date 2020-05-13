class AddDeletedAtToMainTribe < ActiveRecord::Migration[5.2]
  def change
    add_column :main_tribes, :deleted_at, :datetime
    add_index :main_tribes, :deleted_at
  end
end
