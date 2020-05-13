# == Schema Information
#
# Table name: main_provinces
#
#  id         :bigint           not null, primary key
#  province   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string
#  deleted_at :datetime
#
require 'test_helper'

class Main::ProvinceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
