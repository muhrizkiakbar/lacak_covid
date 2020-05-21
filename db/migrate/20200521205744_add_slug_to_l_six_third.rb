class AddSlugToLSixThird < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_thirds, :slug, :string
    add_index :l_six_thirds, :slug, unique: true
  end
end
