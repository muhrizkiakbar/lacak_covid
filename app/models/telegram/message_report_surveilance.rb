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
class Telegram::MessageReportSurveilance < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_surveilance, class_name: 'Telegram::UsernameSurveilance', foreign_key: :telegram_message_report_surveilance_id
end
