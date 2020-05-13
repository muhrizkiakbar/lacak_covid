# == Schema Information
#
# Table name: main_dinkes_regions
#
#  id                      :bigint           not null, primary key
#  dinkes_region           :string
#  main_dinkes_province_id :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  slug                    :string
#  deleted_at              :datetime
#
require 'test_helper'

class Main::DinkesRegionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
