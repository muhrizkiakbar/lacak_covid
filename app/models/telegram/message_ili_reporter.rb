# == Schema Information
#
# Table name: telegram_message_ili_reporters
#
#  id                            :bigint           not null, primary key
#  telegram_username_reporter_id :bigint
#  chat_id                       :string
#  username_telegram             :string
#  message                       :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  deleted_at                    :datetime
#  slug                          :string
#
class Telegram::MessageIliReporter < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  has_one :ls_first, class_name: 'LSix::First', foreign_key: :telegram_message_ili_reporter_id

  belongs_to :patient, class_name: 'Main::Patient', foreign_key: :main_patient_id, optional: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id, optional: true


  def rw_rt_username_message
    "#{citizen_association.citizen_association} - #{neighborhood_association.neighborhood_association} - #{message} "
  end

  belongs_to :message_report_reporter, class_name: 'Telegram::MessageReportReporter', foreign_key: :telegram_message_report_reporter_id
  
  belongs_to :username_reporter, class_name: 'Telegram::UsernameReporter', foreign_key: :telegram_username_reporter_id
end
