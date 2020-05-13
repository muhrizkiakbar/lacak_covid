# == Schema Information
#
# Table name: main_hospitals
#
#  id                    :bigint           not null, primary key
#  hospital              :string
#  is_primary            :boolean
#  main_dinkes_region_id :bigint
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  slug                  :string
#  deleted_at            :datetime
#
class Main::Hospital < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  validates :hospital, presence: true

  belongs_to :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id
end
