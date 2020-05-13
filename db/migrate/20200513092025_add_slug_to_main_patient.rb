class AddSlugToMainPatient < ActiveRecord::Migration[5.2]
  def change
    add_column :main_patients, :slug, :string
    add_index :main_patients, :slug, unique: true
  end
end
