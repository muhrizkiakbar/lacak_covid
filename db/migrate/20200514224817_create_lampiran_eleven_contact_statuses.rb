class CreateLampiranElevenContactStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_contact_statuses do |t|
      t.references :lampiran_eleven_close_contact_information, foreign_key: true, index: {:name => "index_l_e_close_contact_info_on_l_e_contact_status"}
      t.string :status_patient
      t.date :date_of_status_recovered
      t.date :date_of_status_died
      t.boolean :is_been_treated
      t.date :start_date_of_treated
      t.date :end_date_of_treated
      t.boolean :is_dead_with_autopsy
      t.text :result_of_autopsy

      t.timestamps
    end
  end
end
