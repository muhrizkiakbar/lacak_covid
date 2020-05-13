class Main::City < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  has_many :districts, class_name: 'Main::District', foreign_key: :main_city_id
  belongs_to :province, class_name: 'Main::Province', foreign_key: :main_province_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_city_id


  validates :city, presence: true, format: { with: /\w/, message: "Only input text."}
end
