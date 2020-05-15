class AddSomeColumnToLampiranElevenContactSymptom < ActiveRecord::Migration[5.2]
  def change
    add_column :lampiran_eleven_contact_symptoms, :is_contact_experiencing_pain, :boolean
    add_column :lampiran_eleven_contact_symptoms, :is_fever, :boolean
    add_column :lampiran_eleven_contact_symptoms, :is_ili, :boolean
    add_column :lampiran_eleven_contact_symptoms, :explain_of_fever, :text
    add_column :lampiran_eleven_contact_symptoms, :date_of_symptom, :date
    add_column :lampiran_eleven_contact_symptoms, :status_asymptomatic, :boolean
  end
end
