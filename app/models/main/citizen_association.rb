class Main::CitizenAssociation < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :main_neighborhood_associations
  belongs_to :main_sub_district
end
