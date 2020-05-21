class AddDeletedAtToLSixFirst < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_firsts, :deleted_at, :datetime
    add_index :l_six_firsts, :deleted_at
  end
end
