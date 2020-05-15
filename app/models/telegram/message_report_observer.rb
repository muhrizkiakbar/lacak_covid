class Telegram::MessageReportObserver < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_reporter, class_name: 'Telegram::UsernameReporter', foreign_key: :telegram_message_report_reporter_id
end
