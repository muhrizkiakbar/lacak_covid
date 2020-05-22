# == Schema Information
#
# Table name: l_six_f_animal_dests
#
#  id            :bigint           not null, primary key
#  location      :string
#  city          :string
#  visit_date    :date
#  province_city :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  slug          :string
#  deleted_at    :datetime
#
require 'test_helper'

class LSix::FAnimalDestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
