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
  
  belongs_to :username_reporter, class_name: 'Telegram::UsernameReporter', foreign_key: :telegram_message_ili_reporter_id
end
