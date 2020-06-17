class AddLContactListContactListToLContactListContactPatient < ActiveRecord::Migration[5.2]
  def change
    add_reference :l_contact_list_contact_patients, :l_contact_list_contact_list, foreign_key: true, index: {:name => "index_l_c_l_contact_patient_on_l_c_l_cl_id"}
  end
end
