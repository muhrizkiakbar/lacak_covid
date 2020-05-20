class AddIndexToInformationExpose < ActiveRecord::Migration[5.2]
  def change
    # add_index :lampiran_eleven_information_exposes, :date_contact, index: {:name => "index_l_e_info_expose_on_date_contact"}
    # add_index :lampiran_eleven_information_exposes, :duration_contact, index: {:name => "index_l_e_info_expose_on_duration_contact"}
  end
end
