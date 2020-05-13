class Main::PublicHealthCenter < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  validates :public_health_center, presence: true


  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id
end
