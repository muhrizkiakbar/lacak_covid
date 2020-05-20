# == Schema Information
#
# Table name: main_patients
#
#  id                               :bigint           not null, primary key
#  main_tribe_id                    :bigint
#  main_city_id                     :bigint
#  main_district_id                 :bigint
#  main_sub_district_id             :bigint
#  main_citizen_association_id      :bigint
#  main_neighborhood_association_id :bigint
#  main_marital_status_id           :bigint
#  no_identity                      :string
#  name_of_parent                   :string
#  name                             :string
#  address                          :text
#  phone_number                     :string
#  date_of_birth                    :date
#  gender                           :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  slug                             :string
#  deleted_at                       :datetime
#
class Main::Patient < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged

  enum gender: {Male: "male", Female: "female"}

  def self.search options
    self.ransack(options)
  end

  # has_many :districts, class_name: 'Main::District', foreign_key: :main_city_id
  # belongs_to :province, class_name: 'Main::Province', foreign_key: :main_province_id
  
  belongs_to :city, class_name: 'Main::City', foreign_key: :main_city_id
  belongs_to :district, class_name: 'Main::District', foreign_key: :main_district_id
  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id
  belongs_to :citizen_association, class_name: 'Main::CitizenAssociation', foreign_key: :main_citizen_association_id
  belongs_to :neighborhood_association, class_name: 'Main::NeighborhoodAssociation', foreign_key: :main_neighborhood_association_id
  belongs_to :marital_status, class_name: 'Main::MaritalStatus', foreign_key: :main_marital_status_id

  def noidentity_with_name
    "#{no_identity} - #{name}"
  end

  validates :no_identity, presence: true, length: { is: 16 }, numericality: { only_integer: true }, uniqueness: true
  validates :name, :address, :date_of_birth, :gender, presence: true
  validates :phone_number, presence: true, format: { with: /\A(?!.*-.*-.*-)(?=(?:\d{10,12}\z)|(?:(?=.{9,11}\z)[^-]*-[^-]*\z)|(?:(?=.{10,12}\z)[^-]*-[^-]*-[^-]*\z)  )[\d-]+\z/, message: "is minimum length 10 or maximum 12 character numeric."}, uniqueness: true
end
