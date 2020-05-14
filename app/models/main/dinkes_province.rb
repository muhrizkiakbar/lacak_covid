# == Schema Information
#
# Table name: main_dinkes_provinces
#
#  id              :bigint           not null, primary key
#  dinkes_province :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  deleted_at      :datetime
#
class Main::DinkesProvince < ApplicationRecord
    acts_as_paranoid
    extend FriendlyId

    friendly_id :slug_candidates, use: :slugged

    has_many :dinkes_regions, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_province_id, dependent: :destroy
    
    has_many :info_exposes_officers, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :main_dinkes_province_id

    has_many :users, class_name: 'User', foreign_key: :main_dinkes_province_id

    validates :dinkes_province, presence: true
end
