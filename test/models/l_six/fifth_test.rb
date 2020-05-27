# == Schema Information
#
# Table name: l_six_fifths
#
#  id             :bigint           not null, primary key
#  l_six_first_id :bigint
#  name           :string
#  gender         :string
#  relation       :string
#  address        :text
#  phone_number   :string
#  activity       :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string
#  deleted_at     :datetime
#  age            :integer
#
require 'test_helper'

class LSix::FifthTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
