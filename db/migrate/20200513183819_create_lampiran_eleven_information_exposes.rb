class CreateLampiranElevenInformationExposes < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_information_exposes do |t|
      t.references :lampiran_eleven_close_contact_information, foreign_key: true, index: {:name => "index_l_e_close_contact_info_on_l_e_information_expose"}
      t.references :main_type_contact, foreign_key: true, index: {:name => "index_m_type_contact_on_l_e_information_expose"}, :null => true
      t.references :main_set_location, foreign_key: true, index: {:name => "index_m_set_location_on_l_e_information_expose"}, :null => true
      t.string :other_type_contact
      t.date :date_contact
      t.time :duration_contact
      t.string :other_set_location

      t.timestamps
    end
  end
end
