class AddMainPatientToLContactListContactList < ActiveRecord::Migration[5.2]
  def change
    add_reference :l_contact_list_contact_lists, :main_patient, foreign_key: true
  end
end
