# == Schema Information
#
# Table name: telegram_username_rts
#
#  id                               :bigint           not null, primary key
#  main_city_id                     :bigint
#  main_district_id                 :bigint
#  main_sub_district_id             :bigint
#  main_citizen_association_id      :bigint
#  main_neighborhood_association_id :bigint
#  username_telegram                :string
#  last_activity                    :datetime
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  slug                             :string
#  deleted_at                       :datetime
#
require 'test_helper'

class Telegram::UsernameRtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
