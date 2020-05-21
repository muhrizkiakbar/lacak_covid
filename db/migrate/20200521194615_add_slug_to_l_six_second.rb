class AddSlugToLSixSecond < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_seconds, :slug, :string
    add_index :l_six_seconds, :slug, unique: true
  end
end
