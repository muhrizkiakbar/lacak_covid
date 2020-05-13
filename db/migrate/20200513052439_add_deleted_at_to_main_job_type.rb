class AddDeletedAtToMainJobType < ActiveRecord::Migration[5.2]
  def change
    add_column :main_job_types, :deleted_at, :datetime
    add_index :main_job_types, :deleted_at
  end
end
