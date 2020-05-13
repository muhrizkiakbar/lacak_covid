class Main::SetLocation < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    has_many :information_exposes, class_name: 'LampiranEleven::InformationExpose', foreign_key: :main_set_location_id

    validates :set_location, presence: true
end
