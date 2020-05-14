class AddDeletedAtToMainJobPosition < ActiveRecord::Migration[5.2]
  def change
    add_column :main_job_positions, :deleted_at, :datetime
    add_index :main_job_positions, :deleted_at
  end
end
