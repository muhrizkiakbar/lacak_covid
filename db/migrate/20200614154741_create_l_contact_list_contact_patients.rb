class CreateLContactListContactPatients < ActiveRecord::Migration[5.2]
  def change
    create_table :l_contact_list_contact_patients do |t|
      t.references :main_patient, foreign_key: true
      t.references :main_patient_child, foreign_key: {to_table: 'main_patients'}, index: {:name => "index_l_c_l_contact_list_p_child_on_m_patient_id"}
      t.timestamps
    end
  end
end
