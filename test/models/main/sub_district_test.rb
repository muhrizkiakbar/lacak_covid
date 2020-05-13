# == Schema Information
#
# Table name: main_sub_districts
#
#  id               :bigint           not null, primary key
#  sub_district     :string
#  main_district_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  deleted_at       :datetime
#
require 'test_helper'

class Main::SubDistrictTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
