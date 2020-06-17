# == Schema Information
#
# Table name: l_contact_list_contact_lists
#
#  id              :bigint           not null, primary key
#  date_contact    :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  main_patient_id :bigint
#  slug            :string
#
require 'test_helper'

class LContactList::ContactListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
