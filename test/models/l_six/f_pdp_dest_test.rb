# == Schema Information
#
# Table name: l_six_f_pdp_dests
#
#  id                :bigint           not null, primary key
#  name              :string
#  address           :text
#  relation          :string
#  date_contact      :date
#  last_date_contact :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  slug              :string
#  deleted_at        :datetime
#
require 'test_helper'

class LSix::FPdpDestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end