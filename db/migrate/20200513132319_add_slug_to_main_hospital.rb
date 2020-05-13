class AddSlugToMainHospital < ActiveRecord::Migration[5.2]
  def change
    add_column :main_hospitals, :slug, :string
    add_index :main_hospitals, :slug, unique: true
  end
end
