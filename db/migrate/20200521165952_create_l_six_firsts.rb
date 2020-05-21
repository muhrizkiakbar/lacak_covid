class CreateLSixFirsts < ActiveRecord::Migration[5.2]
  def change
    create_table :l_six_firsts do |t|
      t.references :main_patient, foreign_key: true
      t.references :user, foreign_key: true
      t.date :interview_date

      t.timestamps
    end
  end
end
