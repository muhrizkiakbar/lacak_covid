class Main::CitizenAssociation < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :neighborhood_associations, class_name: 'Main::NeighborhoodAssociation', foreign_key: :main_citizen_association_id
  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_citizen_association_id

  validates :citizen_association, presence: true, format: { with: /^\d{3}$/, message: "Only allow 3 character of number."}
end
