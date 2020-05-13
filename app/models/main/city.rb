class Main::City < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :districts, class_name: 'Main::District', foreign_key: :main_city_id
  belongs_to :province, class_name: 'Main::Province', foreign_key: :main_province_id
end
