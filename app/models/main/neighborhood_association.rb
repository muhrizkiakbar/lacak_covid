class Main::NeighborhoodAssociation < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  belongs_to :citizen_association, class_name: 'Main::CitizenAssociation', foreign_key: :main_citizen_association_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_neighborhood_association_id

  validates :neighborhood_association, presence: true, format: { with: /^\d{3}$/, message: "Only allow 3 character of number."}
end
