class AddIndexToCloseContactInformation < ActiveRecord::Migration[5.2]
  def change
    # add_index :lampiran_eleven_close_contact_informations, :fill_in_date, index: {:name => "index_l_e_cc_information_on_fill_in_date"}
    # add_index :lampiran_eleven_close_contact_informations, :contact_tracking_date, index: {:name => "index_l_e_cc_information_on_contact_tracking_date"}
  end
end
