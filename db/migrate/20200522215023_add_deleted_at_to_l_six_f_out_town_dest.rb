class AddDeletedAtToLSixFOutTownDest < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_f_out_town_dests, :deleted_at, :datetime
    add_index :l_six_f_out_town_dests, :deleted_at
  end
end
