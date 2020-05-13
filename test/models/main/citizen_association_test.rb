# == Schema Information
#
# Table name: main_citizen_associations
#
#  id                   :bigint           not null, primary key
#  citizen_association  :string
#  main_sub_district_id :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  slug                 :string
#  deleted_at           :datetime
#
require 'test_helper'

class Main::CitizenAssociationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
