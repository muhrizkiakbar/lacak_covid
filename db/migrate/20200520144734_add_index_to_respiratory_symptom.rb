class AddIndexToRespiratorySymptom < ActiveRecord::Migration[5.2]
#  is_sore_throat                          :boolean
#  date_of_sore_throat                     :date
#  is_cough                                :boolean
#  date_of_cough                           :date
#  is_flu                                  :boolean
#  date_of_flu                             :date
#  is_out_of_breath                        :boolean
#  date_of_out_of_breath                   :date
  def change
    # add_index :lampiran_eleven_respiratory_symptoms, :is_sore_throat, index: {:name => "index_l_e_respiratory_sympt_on_is_sore_throat"}
    # # add_index :lampiran_eleven_respiratory_symptoms, :date_of_sore_throat, index: {:name => "index_l_e_respiratory_sympt_on_sore_throat"}
    # add_index :lampiran_eleven_respiratory_symptoms, :is_cough, index: {:name => "index_l_e_respiratory_sympt_on_is_cough"}
    # # add_index :lampiran_eleven_respiratory_symptoms, :date_of_cough, index: {:name => "index_l_e_respiratory_sympt_on_date_cough"}
    # add_index :lampiran_eleven_respiratory_symptoms, :is_flu, index: {:name => "index_l_e_respiratory_sympt_on_is_flu"}
    # # add_index :lampiran_eleven_respiratory_symptoms, :date_of_flu, index: {:name => "index_l_e_respiratory_sympt_on_date_flu"}
    # add_index :lampiran_eleven_respiratory_symptoms, :is_out_of_breath, index: {:name => "index_l_e_respiratory_sympt_on_is_out_breath"}
    # # add_index :lampiran_eleven_respiratory_symptoms, :date_of_out_of_breath, index: {:name => "index_l_e_respiratory_sympt_on_date_breath"}
  end
end
