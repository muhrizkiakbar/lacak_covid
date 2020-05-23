class AddDeletedAtToLSixFifth < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_fifths, :deleted_at, :datetime
    add_index :l_six_fifths, :deleted_at
  end
end
