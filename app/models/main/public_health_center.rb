# == Schema Information
#
# Table name: main_public_health_centers
#
#  id                   :bigint           not null, primary key
#  public_health_center :string
#  main_hospital_id     :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  slug                 :string
#  deleted_at           :datetime
#
class Main::PublicHealthCenter < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  validates :public_health_center, presence: true


  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id
end
