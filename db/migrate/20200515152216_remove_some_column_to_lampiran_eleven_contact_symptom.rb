class RemoveSomeColumnToLampiranElevenContactSymptom < ActiveRecord::Migration[5.2]
  def change
    remove_column :lampiran_eleven_contact_symptoms, :is_sore_throat
    remove_column :lampiran_eleven_contact_symptoms, :date_of_sore_throat
    remove_column :lampiran_eleven_contact_symptoms, :is_cough
    remove_column :lampiran_eleven_contact_symptoms, :date_of_cough
    remove_column :lampiran_eleven_contact_symptoms, :is_flu
    remove_column :lampiran_eleven_contact_symptoms, :date_of_flu
    remove_column :lampiran_eleven_contact_symptoms, :is_out_of_breath
    remove_column :lampiran_eleven_contact_symptoms, :date_of_out_of_breath
  end
end
