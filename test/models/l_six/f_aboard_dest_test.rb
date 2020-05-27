# == Schema Information
#
# Table name: l_six_f_aboard_dests
#
#  id              :bigint           not null, primary key
#  l_six_fourth_id :bigint
#  country         :string
#  city            :string
#  travel_date     :date
#  date_arrive     :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  deleted_at      :datetime
#
require 'test_helper'

class LSix::FAboardDestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
