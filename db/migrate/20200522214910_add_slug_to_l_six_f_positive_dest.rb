class AddSlugToLSixFPositiveDest < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_f_positive_dests, :slug, :string
    add_index :l_six_f_positive_dests, :slug, unique: true
  end
end
