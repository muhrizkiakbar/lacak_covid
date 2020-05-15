class Telegram::MessageIliRt < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_rt, class_name: 'Telegram::UsernameRt', foreign_key: :telegram_message_ili_rt_id
end
