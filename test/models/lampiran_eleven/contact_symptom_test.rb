# == Schema Information
#
# Table name: lampiran_eleven_contact_symptoms
#
#  id                                      :bigint           not null, primary key
#  lampiran_eleven_info_exposes_officer_id :bigint
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  slug                                    :string
#  deleted_at                              :datetime
#  is_contact_experiencing_pain            :boolean
#  is_fever                                :boolean
#  is_ili                                  :boolean
#  explain_of_fever                        :text
#  date_of_symptom                         :date
#  status_asymptomatic                     :boolean
#
require 'test_helper'

class LampiranEleven::ContactSymptomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
