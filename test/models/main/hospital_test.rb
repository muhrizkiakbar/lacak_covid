# == Schema Information
#
# Table name: main_hospitals
#
#  id                    :bigint           not null, primary key
#  hospital              :string
#  is_primary            :boolean
#  main_dinkes_region_id :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  slug                  :string
#  deleted_at            :datetime
#
require 'test_helper'

class Main::HospitalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
