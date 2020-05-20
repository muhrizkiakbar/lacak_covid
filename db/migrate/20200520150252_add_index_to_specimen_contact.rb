class AddIndexToSpecimenContact < ActiveRecord::Migration[5.2]
  def change
    # add_index :lampiran_eleven_specimen_contacts, :type_of_specimen, index: {:name => "index_l_e_specimen_con_on_type_specimen"}
    # add_index :lampiran_eleven_specimen_contacts, :date_of_specimen_collection, index: {:name => "index_l_e_specimen_con_on_date_specimen"}
  end
end
