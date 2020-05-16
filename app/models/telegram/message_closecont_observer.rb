class Telegram::MessageClosecontObserver < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_observer, class_name: 'Telegram::UsernameObserver', foreign_key: :telegram_username_observer_id
end
