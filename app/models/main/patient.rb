class Main::Patient < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  # has_many :districts, class_name: 'Main::District', foreign_key: :main_city_id
  # belongs_to :province, class_name: 'Main::Province', foreign_key: :main_province_id
  
  belongs_to :tribe, class_name: 'Main::Tribe', foreign_key: :main_tribe_id
  belongs_to :city, class_name: 'Main::City', foreign_key: :main_city_id
  belongs_to :district, class_name: 'Main::District', foreign_key: :main_district_id
  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id
  belongs_to :citizen_association, class_name: 'Main::CitizenAssociation', foreign_key: :main_citizen_association_id
  belongs_to :neighborhood_association, class_name: 'Main::NeighborhoodAssociation', foreign_key: :main_neighborhood_association_id
  belongs_to :marital_status, class_name: 'Main::MaritalStatus', foreign_key: :main_marital_status_id
end
