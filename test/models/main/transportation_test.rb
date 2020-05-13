# == Schema Information
#
# Table name: main_transportations
#
#  id             :bigint           not null, primary key
#  transportation :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  deleted_at     :datetime
#  slug           :string
#
require 'test_helper'

class Main::TransportationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
