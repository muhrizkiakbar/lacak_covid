# == Schema Information
#
# Table name: telegram_message_report_reporters
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
class Telegram::MessageReportReporter < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :message_ili_reporters, class_name: 'Telegram::MessageReportReporter', foreign_key: :telegram_message_report_reporter_id
  has_many :message_closecont_reporters, class_name: 'Telegram::MessageIliReporter', foreign_key: :telegram_message_report_reporter_id
  has_many :message_traveler_reporters, class_name: 'Telegram::MessageTravelerReporter', foreign_key: :telegram_message_report_reporter_id
  
  belongs_to :username_reporter, class_name: 'Telegram::UsernameReporter', foreign_key: :telegram_username_reporter_id
end
