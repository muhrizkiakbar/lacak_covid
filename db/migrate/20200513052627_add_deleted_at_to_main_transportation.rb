class AddDeletedAtToMainTransportation < ActiveRecord::Migration[5.2]
  def change
    add_column :main_transportations, :deleted_at, :datetime
    add_index :main_transportations, :deleted_at
  end
end
