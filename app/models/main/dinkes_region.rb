# == Schema Information
#
# Table name: main_dinkes_regions
#
#  id                      :bigint           not null, primary key
#  dinkes_region           :string
#  main_dinkes_province_id :bigint
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  slug                    :string
#  deleted_at              :datetime
#  main_city_id            :bigint
#
class Main::DinkesRegion < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  validates :dinkes_region, presence: true

  def self.search options
    self.ransack(options)
  end

  def dinkes_region_city
    "#{dinkes_region} - #{city.city}"
  end

  has_many :info_exposes_officers, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :main_dinkes_region_id

  has_many :username_observers, class_name: 'Telegram::UsernameObserver', foreign_key: :main_dinkes_region_id

  belongs_to :city, class_name: 'Main::City', foreign_key: :main_city_id
  has_many :hospitals, class_name: 'Main::Hospital', foreign_key: :main_dinkes_region_id, dependent: :destroy
  has_many :public_health_centers, class_name: 'Main::PublicHealthCenter', foreign_key: :main_dinkes_region_id, dependent: :destroy
  belongs_to :dinkes_province, class_name: 'Main::DinkesProvince', foreign_key: :main_dinkes_province_id

  has_many :users, class_name: 'User', foreign_key: :main_dinkes_region_id
end
