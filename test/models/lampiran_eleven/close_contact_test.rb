# == Schema Information
#
# Table name: lampiran_eleven_close_contacts
#
#  id                                    :bigint           not null, primary key
#  lampiran_eleven_information_expose_id :bigint
#  start_travel_qn_2_id                  :bigint
#  end_travel_qn_2_id                    :bigint
#  main_job_type_id                      :bigint
#  main_transportation_id                :bigint
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
require 'test_helper'

class LampiranEleven::CloseContactTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
