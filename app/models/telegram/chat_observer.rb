# == Schema Information
#
# Table name: telegram_chat_observers
#
#  id                            :bigint           not null, primary key
#  chat_id                       :string
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  telegram_username_observer_id :bigint
#
class Telegram::ChatObserver < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  belongs_to :username_observer, class_name: 'Telegram::UsernameObserver', foreign_key: :telegram_username_observer_id
end
