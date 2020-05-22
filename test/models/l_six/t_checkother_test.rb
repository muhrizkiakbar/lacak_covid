# == Schema Information
#
# Table name: l_six_t_checkothers
#
#  id                 :bigint           not null, primary key
#  l_six_third_id     :bigint
#  other_check        :string
#  date_check_other   :date
#  place_check_other  :string
#  result_check_other :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  slug               :string
#  deleted_at         :datetime
#
require 'test_helper'

class LSix::TCheckotherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
