class Main::District < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :main_sub_districts
  belongs_to :main_city
end
