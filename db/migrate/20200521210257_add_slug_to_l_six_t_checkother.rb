class AddSlugToLSixTCheckother < ActiveRecord::Migration[5.2]
  def change
    add_column :l_six_t_checkothers, :slug, :string
    add_index :l_six_t_checkothers, :slug, unique: true
  end
end
