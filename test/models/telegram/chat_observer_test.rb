# == Schema Information
#
# Table name: telegram_chat_observers
#
#  id                            :bigint           not null, primary key
#  telegram_username_reporter_id :bigint
#  chat_id                       :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
require 'test_helper'

class Telegram::ChatObserverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
