class CreateLampiranElevenCloseContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_close_contacts do |t|
      t.references :lampiran_eleven_information_expose, foreign_key: true, 
      t.references :start_travel_qn_1, index: true, foreign_key: { to_table: :main_cities }
      t.references :end_travel_qn_1, index: true, foreign_key: { to_table: :main_cities }
      t.references :start_travel_qn_2, index: true, foreign_key: { to_table: :main_cities }
      t.references :end_travel_qn_2, index: true, foreign_key: { to_table: :main_cities }
      t.references :main_job_type, foreign_key: true
      t.references :main_transportation, foreign_key: true
      t.boolean :question_number_1
      t.date :date_question_number_1
      t.boolean :question_number_2
      t.date :date_question_number_2
      t.boolean :question_number_3
      t.date :date_question_number_3
      t.string :other_job_type
      t.text :address_job
      t.string :other_transportation

      t.timestamps
    end
  end
end
