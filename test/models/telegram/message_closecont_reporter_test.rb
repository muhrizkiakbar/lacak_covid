# == Schema Information
#
# Table name: telegram_message_closecont_reporters
#
#  id                            :bigint           not null, primary key
#  telegram_username_reporter_id :bigint
#  chat_id                       :string
#  username_telegram             :string
#  message                       :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  slug                          :string
#  deleted_at                    :datetime
#
require 'test_helper'

class Telegram::MessageClosecontReporterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
