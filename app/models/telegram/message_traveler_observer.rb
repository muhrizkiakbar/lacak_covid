# == Schema Information
#
# Table name: telegram_message_traveler_observers
#
#  id                            :bigint           not null, primary key
#  telegram_username_observer_id :bigint
#  chat_id                       :string
#  username_telegram             :string
#  message                       :text
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  slug                          :string
#  deleted_at                    :datetime
#
class Telegram::MessageTravelerObserver < ApplicationRecord
  self.table_name_prefix = 'telegram_'
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_observer, class_name: 'Telegram::UsernameObserver', foreign_key: :telegram_username_observer_id
end
