class CreateLampiranElevenCloseContactInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_close_contact_informations do |t|
      t.references :user, foreign_key: true
      t.references :main_patient, foreign_key: true, index: {:name => "index_m_patient_on_l_e_close_contact_info"}
      t.references :main_public_health_center, foreign_key: true, index: {:name => "index_m_public_health_ctr_on_l_e_close_contact_info"}
      t.date :fill_in_date
      t.date :contact_tracking_date
      t.string :contact_with_positive_case
      t.text :placement

      t.timestamps
    end
  end
  
end
