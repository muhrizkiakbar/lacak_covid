# == Schema Information
#
# Table name: telegram_message_closecont_observers
#
#  id                            :bigint           not null, primary key
#  telegram_username_observer_id :bigint
#  chat_id                       :string
#  username_telegram             :string
#  message                       :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  slug                          :string
#  deleted_at                    :datetime
#
require 'test_helper'

class Telegram::MessageClosecontObserverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
