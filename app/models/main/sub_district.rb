class Main::SubDistrict < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :main_citizen_associations
  belongs_to :main_district
end
