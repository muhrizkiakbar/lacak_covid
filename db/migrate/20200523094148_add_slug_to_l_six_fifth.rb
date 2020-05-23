class AddSlugToLSixFifth < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_fifths, :slug, :string
    add_index :l_six_fifths, :slug, unique: true
  end
end
