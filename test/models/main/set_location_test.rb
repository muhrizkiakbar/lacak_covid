# == Schema Information
#
# Table name: main_set_locations
#
#  id           :bigint           not null, primary key
#  set_location :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  deleted_at   :datetime
#
require 'test_helper'

class Main::SetLocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
