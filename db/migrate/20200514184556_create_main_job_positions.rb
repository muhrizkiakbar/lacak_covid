class CreateMainJobPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :main_job_positions do |t|
      t.string :job_position

      t.timestamps
    end
  end
end
