# == Schema Information
#
# Table name: telegram_message_ili_surveilances
#
#  id                               :bigint           not null, primary key
#  telegram_username_surveilance_id :bigint
#  chat_id                          :string
#  username_telegram                :string
#  message                          :text
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  slug                             :string
#  deleted_at                       :datetime
#
class Telegram::MessageIliSurveilance < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :username_surveilance, class_name: 'Telegram::UsernameSurveilance', foreign_key: :telegram_message_ili_surveilance_id
end
