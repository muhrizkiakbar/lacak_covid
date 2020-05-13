# == Schema Information
#
# Table name: main_districts
#
#  id           :bigint           not null, primary key
#  district     :string
#  main_city_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  deleted_at   :datetime
#
require 'test_helper'

class Main::DistrictTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
