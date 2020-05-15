# == Schema Information
#
# Table name: telegram_message_ili_rts
#
#  id                      :bigint           not null, primary key
#  telegram_username_rt_id :bigint
#  chat_id                 :string
#  username_telegram       :string
#  message                 :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  slug                    :string
#  deleted_at              :datetime
#
require 'test_helper'

class Telegram::MessageIliRtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
