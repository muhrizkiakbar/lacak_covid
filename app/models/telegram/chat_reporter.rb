# == Schema Information
#
# Table name: telegram_chat_reporters
#
#  id                            :bigint           not null, primary key
#  telegram_username_reporter_id :bigint
#  chat_id                       :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
class Telegram::ChatReporter < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  belongs_to :username_reporter, class_name: 'Telegram::UsernameReporter', foreign_key: :telegram_username_reporter_id
end
