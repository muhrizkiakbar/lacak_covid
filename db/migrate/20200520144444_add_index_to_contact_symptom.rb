class AddIndexToContactSymptom < ActiveRecord::Migration[5.2]
#  is_contact_experiencing_pain            :boolean
#  is_fever                                :boolean
#  is_ili                                  :boolean
#  explain_of_fever                        :text
#  date_of_symptom                         :date
#  status_asymptomatic                     :boolean
  def change
    # add_index :lampiran_eleven_contact_symptoms, :is_contact_experiencing_pain, index: {:name => "index_l_e_cont_sympt_on_is_ce_pain"}
    # add_index :lampiran_eleven_contact_symptoms, :is_fever, index: {:name => "index_l_e_cont_sympt_on_is_fever"}
    # add_index :lampiran_eleven_contact_symptoms, :is_ili, index: {:name => "index_l_e_cont_sympt_on_is_ili"}
    # add_index :lampiran_eleven_contact_symptoms, :status_asymptomatic, index: {:name => "index_l_e_cont_sympt_on_status_asympto"}
    # add_index :lampiran_eleven_contact_symptoms, :date_of_symptom, index: {:name => "index_l_e_cont_sympt_on_date_symptom"}
  end
end
