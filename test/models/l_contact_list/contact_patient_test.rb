# == Schema Information
#
# Table name: l_contact_list_contact_patients
#
#  id                             :bigint           not null, primary key
#  main_patient_id                :bigint
#  main_patient_child_id          :bigint
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  l_contact_list_contact_list_id :bigint
#
require 'test_helper'

class LContactList::ContactPatientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
