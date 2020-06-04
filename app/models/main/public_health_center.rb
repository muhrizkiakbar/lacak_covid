# == Schema Information
#
# Table name: main_public_health_centers
#
#  id                    :bigint           not null, primary key
#  public_health_center  :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  slug                  :string
#  deleted_at            :datetime
#  main_sub_district_id  :bigint
#  main_dinkes_region_id :bigint
#
class Main::PublicHealthCenter < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  attr_reader :with_sub_district

  friendly_id :slug_candidates, use: :slugged

  validates :public_health_center, presence: true

  scope :newest_first, -> { order(created_at: :asc) }

  def self.search options
    self.ransack(options)
  end


  

  has_many :info_exposes_officers, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :main_public_health_center_id

  has_many :username_observers, class_name: 'Telegram::UsernameObserver', foreign_key: :main_public_health_center_id

  belongs_to :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id
  # belongs_to :dinkes_province, class_name: 'Main::DinkesProvince', foreign_key: :main_dinkes_province_id
  #old
  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id, optional: true
  #new
  has_many :phc_of_sds, class_name: 'Main::PhcOfSd', foreign_key: :main_public_health_center_id
  has_many :sub_districts, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id, through: :phc_of_sds

  
  def sub_district
    Main::SubDistrict.unscoped {super}
  end


  def dinkes_region
    Main::DinkesRegion.unscoped {super}
  end


  has_many :users, class_name: 'User', foreign_key: :main_public_health_center_id
end
