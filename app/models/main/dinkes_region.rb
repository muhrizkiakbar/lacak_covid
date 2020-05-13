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

  belongs_to :city, class_name: 'Main::City', foreign_key: :main_city_id
  has_many :hospitals, class_name: 'Main::Hospital', foreign_key: :main_dinkes_region_id
  belongs_to :dinkes_province, class_name: 'Main::DinkesProvince', foreign_key: :main_dinkes_province_id

  has_many :users, class_name: 'User', foreign_key: :main_dinkes_region_id
end
