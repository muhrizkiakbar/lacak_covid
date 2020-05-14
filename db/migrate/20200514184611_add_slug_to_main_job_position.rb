class AddSlugToMainJobPosition < ActiveRecord::Migration[5.2]
  def change
    add_column :main_job_positions, :slug, :string
    add_index :main_job_positions, :slug, unique: true
  end
end
