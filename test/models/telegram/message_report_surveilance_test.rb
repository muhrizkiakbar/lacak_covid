# == Schema Information
#
# Table name: telegram_message_report_surveilances
#
#  id                               :bigint           not null, primary key
#  telegram_username_surveilance_id :bigint
#  chat_id                          :string
#  message                          :text
#  username_telegram                :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  deleted_at                       :datetime
#  slug                             :string
#
require 'test_helper'

class Telegram::MessageReportSurveilanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
