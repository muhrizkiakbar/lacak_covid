class Telegram::MessageIliObserver < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_observer, class_name: 'Telegram::UsernameObeserver', foreign_key: :telegram_message_ili_observer_id
end
