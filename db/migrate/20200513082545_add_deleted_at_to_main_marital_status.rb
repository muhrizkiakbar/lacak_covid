class AddDeletedAtToMainMaritalStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :main_marital_statuses, :deleted_at, :datetime
    add_index :main_marital_statuses, :deleted_at
  end
end
