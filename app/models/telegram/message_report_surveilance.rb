class Telegram::MessageReportSurveilance < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_surveilance, class_name: 'Telegram::UsernameSurveilance', foreign_key: :telegram_message_report_surveilance_id
end
