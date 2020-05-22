class AddSlugToLSixFourth < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_fourths, :slug, :string
    add_index :l_six_fourths, :slug, unique: true
  end
end
