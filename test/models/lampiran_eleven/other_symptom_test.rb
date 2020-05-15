# == Schema Information
#
# Table name: lampiran_eleven_other_symptoms
#
#  id                                      :bigint           not null, primary key
#  lampiran_eleven_info_exposes_officer_id :bigint
#  is_shivering                            :boolean
#  is_nausea                               :boolean
#  is_convulsions                          :boolean
#  is_fatigue                              :boolean
#  is_headache                             :boolean
#  is_joint_pain                           :boolean
#  is_muscleache                           :boolean
#  is_throw_up                             :boolean
#  is_diarrhea                             :boolean
#  is_rash                                 :boolean
#  is_conjuctivitis                        :boolean
#  is_bloody_nose                          :boolean
#  is_loss_of_consciousness                :boolean
#  is_loss_of_appetite                     :boolean
#  is_neurologis                           :boolean
#  tell_of_neurologis                      :text
#  other_symptom                           :text
#  created_at                              :datetime         not null
#  updated_at                              :datetime         not null
#  slug                                    :string
#  deleted_at                              :datetime
#  is_weak                                 :boolean
#
require 'test_helper'

class LampiranEleven::OtherSymptomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
