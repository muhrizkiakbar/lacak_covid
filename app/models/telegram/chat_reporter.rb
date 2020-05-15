class Telegram::ChatReporter < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  belongs_to :username_reporter, class_name: 'Telegram::UsernameReporter', foreign_key: :telegram_chat_reporter_id
end
