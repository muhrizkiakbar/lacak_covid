# == Schema Information
#
# Table name: telegram_message_report_rts
#
#  id                      :bigint           not null, primary key
#  telegram_username_rt_id :bigint
#  chat_id                 :string
#  message                 :text
#  username_telegram       :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  slug                    :string
#  deleted_at              :datetime
#
require 'test_helper'

class Telegram::MessageReportRtTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
