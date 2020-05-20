class AddIndexToCloseContact < ActiveRecord::Migration[5.2]
  def change

#  question_number_1                     :boolean
#  date_question_number_1                :date
#  question_number_2                     :boolean
#  date_question_number_2                :date
#  question_number_3                     :boolean
#  date_question_number_3                :date
#  other_job_type                        :string
#  address_job                           :text
#  other_transportation                  :string
#  created_at                            :datetime         not null
#  updated_at                            :datetime         not null
#  slug                                  :string
#  deleted_at                            :datetime
#  answer_qn_1                           :string
#
    # add_index :lampiran_eleven_close_contacts, :question_number_1, index: {:name => "index_l_e_close_contact_on_qn_1"}
    # # add_index :lampiran_eleven_close_contacts, :date_question_number_1, index: {:name => "index_l_e_close_contact_on_dqn_1"}
    # add_index :lampiran_eleven_close_contacts, :question_number_2, index: {:name => "index_l_e_close_contact_on_qn_2"}
    # # add_index :lampiran_eleven_close_contacts, :date_question_number_2, index: {:name => "index_l_e_close_contact_on_dqn_2"}
    # add_index :lampiran_eleven_close_contacts, :question_number_3, index: {:name => "index_l_e_close_contact_on_qn_3"}
    # # add_index :lampiran_eleven_close_contacts, :date_question_number_3, index: {:name => "index_l_e_close_contact_on_dqn_3"}
  end
end
