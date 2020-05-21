class AddSlugToLSixFirst < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_firsts, :slug, :string
    add_index :l_six_firsts, :slug, unique: true
  end
end
