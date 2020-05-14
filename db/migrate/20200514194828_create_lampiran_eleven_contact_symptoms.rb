class CreateLampiranElevenContactSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_contact_symptoms do |t|
      t.references :lampiran_eleven_info_exposes_officer, foreign_key: true, index: {:name => "index_l_e_info_exposes_officer_on_l_e_contact_symptom"}
      t.boolean :is_sore_throat
      t.date :date_of_sore_throat
      t.boolean :is_cough
      t.date :date_of_cough
      t.boolean :is_flu
      t.date :date_of_flu
      t.boolean :is_out_of_breath
      t.date :date_of_out_of_breath

      t.timestamps
    end
  end
end
