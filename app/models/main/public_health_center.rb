# == Schema Information
#
# Table name: main_public_health_centers
#
#  id                   :bigint           not null, primary key
#  public_health_center :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  slug                 :string
#  deleted_at           :datetime
#  main_sub_district_id :bigint
#
class Main::PublicHealthCenter < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  validates :public_health_center, presence: true


  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id

  has_many :users, class_name: 'User', foreign_key: :main_public_health_center_id
end
