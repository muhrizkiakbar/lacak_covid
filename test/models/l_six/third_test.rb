# == Schema Information
#
# Table name: l_six_thirds
#
#  id                    :bigint           not null, primary key
#  l_six_second_id       :bigint
#  date_nasopharyngeal   :date
#  place_nasopharyngeal  :string
#  result_nasopharyngeal :text
#  date_oropharyngeal    :date
#  place_oropharyngeal   :string
#  result_oropharyngeal  :text
#  date_sputum           :date
#  place_sputum          :string
#  result_sputum         :text
#  date_serum            :date
#  place_serum           :string
#  result_serum          :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  slug                  :string
#  deleted_at            :datetime
#
require 'test_helper'

class LSix::ThirdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
