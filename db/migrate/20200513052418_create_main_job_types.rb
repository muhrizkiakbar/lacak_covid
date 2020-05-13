class CreateMainJobTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :main_job_types do |t|
      t.string :job_type

      t.timestamps
    end
  end
end
