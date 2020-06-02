# == Schema Information
#
# Table name: telegram_username_reporters
#
#  id                               :bigint           not null, primary key
#  main_city_id                     :bigint
#  main_district_id                 :bigint
#  main_sub_district_id             :bigint
#  main_citizen_association_id      :bigint
#  main_neighborhood_association_id :bigint
#  username_telegram                :string
#  last_activity_at                 :datetime
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  slug                             :string
#  deleted_at                       :datetime
#  name                             :string
#  phone_number                     :string
#  address                          :string
#
class Telegram::UsernameReporter < ApplicationRecord

  self.table_name_prefix = 'telegram_'
  
  acts_as_paranoid
  extend FriendlyId


  def self.search options
    self.ransack(options)
  end

  scope :newest_first, -> { order(created_at: :asc) }

  friendly_id :slug_candidates, use: :slugged

  validates :name, :address, :phone_number, presence: true
  validates :phone_number, presence: true, format: { with: /\A(?!.*-.*-.*-)(?=(?:\d{10,12}\z)|(?:(?=.{9,11}\z)[^-]*-[^-]*\z)|(?:(?=.{10,12}\z)[^-]*-[^-]*-[^-]*\z)  )[\d-]+\z/, message: "is minimum length 10 or maximum 12 character numeric."}, uniqueness: true

  has_many :message_report_reporter, class_name: 'Telegram::MessageReportReporter', foreign_key: :telegram_username_reporter_id
  has_many :message_ili_reporter, class_name: 'Telegram::MessageIliReporter', foreign_key: :telegram_username_reporter_id
  has_many :message_traveler_reporter, class_name: 'Telegram::MessageTravelerReporter', foreign_key: :telegram_username_reporter_id
  has_many :message_closecont_reporter, class_name: 'Telegram::MessageClosecontReporter', foreign_key: :telegram_username_reporter_id
  has_many :message_checkin_reporter, class_name: 'Telegram::MessageCheckinReporter', foreign_key: :telegram_username_reporter_id

  has_one :chat_reporter, class_name: 'Telegram::ChatReporter', foreign_key: :telegram_username_reporter_id, dependent: :destroy
  
  belongs_to :city, class_name: 'Main::City', foreign_key: :main_city_id
  belongs_to :district, class_name: 'Main::District', foreign_key: :main_district_id
  belongs_to :sub_district, class_name: 'Main::SubDistrict', foreign_key: :main_sub_district_id
  belongs_to :citizen_association, class_name: 'Main::CitizenAssociation', foreign_key: :main_citizen_association_id
  belongs_to :neighborhood_association, class_name: 'Main::NeighborhoodAssociation', foreign_key: :main_neighborhood_association_id



  def city
    Main::City.unscoped {super}
  end

  def district
    Main::District.unscoped {super}
  end
  def sub_district
    Main::SubDistrict.unscoped {super}
  end

  def citizen_association
    Main::CitizenAssociation.unscoped {super}
  end

  def neighborhood_association
    Main::NeighborhoodAssociation.unscoped {super}
  end
end
