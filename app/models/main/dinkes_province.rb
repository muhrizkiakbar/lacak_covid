class Main::DinkesProvince < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    has_many :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id

    validates :dinkes_province, presence: true
end
