# == Schema Information
#
# Table name: main_sub_districts
#
#  id               :bigint           not null, primary key
#  sub_district     :string
#  main_district_id :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  deleted_at       :datetime
#
class Main::SubDistrict < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged



  has_many :citizen_associations, class_name: 'Main::CitizenAssociation', foreign_key: :main_sub_district_id, dependent: :destroy
  belongs_to :district, class_name: 'Main::District', foreign_key: :main_district_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_sub_district_id
  has_many :public_health_centers, class_name: 'Main::PublicHealthCenter', foreign_key: :main_sub_district_id


  validates :sub_district, presence: true
end
