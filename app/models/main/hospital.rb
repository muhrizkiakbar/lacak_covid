class Main::Hospital < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  validates :hospital, presence: true

  has_many :public_health_centers, class_name: 'Main::PublicHealthCenter', foreign_key: :main_dinkes_region_id
  belongs_to :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id
end
