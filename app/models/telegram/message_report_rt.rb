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
class Telegram::MessageReportRt < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_rt, class_name: 'Telegram::UsernameRt', foreign_key: :telegram_message_report_rt_id
end
