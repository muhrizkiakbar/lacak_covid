# == Schema Information
#
# Table name: main_cities
#
#  id               :bigint           not null, primary key
#  city             :string
#  main_province_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  deleted_at       :datetime
#
class Main::City < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :districts, class_name: 'Main::District', foreign_key: :main_city_id
  belongs_to :province, class_name: 'Main::Province', foreign_key: :main_province_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_city_id
  has_many :hospital, class_name: 'Main::Hospital', foreign_key: :main_city_id


  validates :city, presence: true
end
