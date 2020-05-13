class AddSlugToMainJobType < ActiveRecord::Migration[5.2]
  def change
    add_column :main_job_types, :slug, :string
    add_index :main_job_types, :slug, unique: true
  end
end
