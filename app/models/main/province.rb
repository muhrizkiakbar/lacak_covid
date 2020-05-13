class Main::Province < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    has_many :cities, class_name: 'Main::City', foreign_key: :main_province_id


    validates :province, presence: true
end
