# == Schema Information
#
# Table name: telegram_username_observers
#
#  id                           :bigint           not null, primary key
#  main_dinkes_province_id      :bigint
#  main_dinkes_region_id        :bigint
#  main_hospital_id             :bigint
#  main_public_health_center_id :bigint
#  user_id                      :bigint
#  username_telegram            :string
#  last_activity_at             :datetime
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  slug                         :string
#  deleted_at                   :datetime
#
require 'test_helper'

class Telegram::UsernameObserverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
