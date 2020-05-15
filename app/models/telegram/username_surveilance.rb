# == Schema Information
#
# Table name: telegram_username_surveilances
#
#  id                           :bigint           not null, primary key
#  main_dinkes_province_id      :bigint
#  main_dinkes_region_id        :bigint
#  main_hospital_id             :bigint
#  main_public_health_center_id :bigint
#  user_id                      :bigint
#  username_telegram            :string
#  last_activity_at             :datetime
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  slug                         :string
#  deleted_at                   :datetime
#
class Telegram::UsernameSurveilance < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :message_report_surveilance, class_name: 'Telegram::MessageReportSurveilance', foreign_key: :telegram_username_surveilance_id
  has_many :message_ili_surveilance, class_name: 'Telegram::MessageIliSurveilance', foreign_key: :telegram_username_surveilance_id
  
  belongs_to :dinkes_province, class_name: 'Main::DinkesProvince', foreign_key: :main_dinkes_province_id
  belongs_to :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id
  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id
  belongs_to :public_health_center, class_name: 'Main::PublicHealthCenter', foreign_key: :main_public_health_center_id
  belongs_to :user, class_name: 'User', foreign_key: :user_id
end
