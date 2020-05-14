class CreateLampiranElevenSpecimenContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :lampiran_eleven_specimen_contacts do |t|
      t.references :lampiran_eleven_close_contact_information, foreign_key: true, index: {:name => "index_l_e_close_contact_info_on_l_e_specimen_contact"}
      t.boolean :type_of_specimen
      t.date :date_of_specimen_collection
      t.text :laboratory_examination_results

      t.timestamps
    end
  end
end
