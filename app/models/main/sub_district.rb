class Main::SubDistrict < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :citizen_associations, class_name: 'Main::CitizenAssociation', foreign_key: :main_sub_district_id
  belongs_to :district, class_name: 'Main::District', foreign_key: :main_district_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_sub_district_id


  validates :sub_district, presence: true, format: { with: /\w/, message: "Only input text."}
end
