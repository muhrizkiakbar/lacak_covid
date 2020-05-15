# == Schema Information
#
# Table name: telegram_message_ili_observers
#
#  id                            :bigint           not null, primary key
#  telegram_username_observer_id :bigint
#  chat_id                       :string
#  username_telegram             :string
#  message                       :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  deleted_at                    :datetime
#  slug                          :string
#
class Telegram::MessageIliObserver < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_observer, class_name: 'Telegram::UsernameObeserver', foreign_key: :telegram_message_ili_observer_id
end
