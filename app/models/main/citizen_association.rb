# == Schema Information
#
# Table name: main_citizen_associations
#
#  id                   :bigint           not null, primary key
#  citizen_association  :string
#  main_sub_district_id :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  slug                 :string
#  deleted_at           :datetime
#
class Main::CitizenAssociation < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged



  has_many :neighborhood_associations, class_name: 'Main::NeighborhoodAssociation', foreign_key: :main_citizen_association_id, dependent: :destroy
  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id
  has_many :patients, class_name: 'Main::Patient', foreign_key: :main_citizen_association_id

  has_many :username_reporters, class_name: 'Telegram::UsernameReporter', foreign_key: :main_citizen_association_id

  validates :citizen_association, presence: true, length: { is: 3 }, numericality: { only_integer: true }
end
