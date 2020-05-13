# == Schema Information
#
# Table name: main_districts
#
#  id           :bigint           not null, primary key
#  district     :string
#  main_city_id :bigint
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  slug         :string
#  deleted_at   :datetime
#
class Main::District < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :sub_districts, class_name: 'Main::SubDistrict', foreign_key: :main_district_id
  belongs_to :city, class_name: 'Main::City', foreign_key: :main_city_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_district_id

  validates :district, presence: true
end
