# == Schema Information
#
# Table name: main_phc_of_sds
#
#  id                           :bigint           not null, primary key
#  main_public_health_center_id :bigint
#  main_sub_district_id         :bigint
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
require 'test_helper'

class Main::PhcOfSdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
