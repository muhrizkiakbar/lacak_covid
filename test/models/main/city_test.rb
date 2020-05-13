# == Schema Information
#
# Table name: main_cities
#
#  id               :bigint           not null, primary key
#  city             :string
#  main_province_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  deleted_at       :datetime
#
require 'test_helper'

class Main::CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
