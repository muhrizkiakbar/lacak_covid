# == Schema Information
#
# Table name: telegram_message_traveler_reporters
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
class Telegram::MessageTravelerReporter < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  

  belongs_to :patient, class_name: 'Main::Patient', foreign_key: :main_patient_id, optional: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: true
  belongs_to :message_report_reporter, class_name: 'Telegram::MessageReportReporter', foreign_key: :telegram_message_report_reporter_id
  
  belongs_to :username_reporter, class_name: 'Telegram::UsernameReporter', foreign_key: :telegram_username_reporter_id
end
