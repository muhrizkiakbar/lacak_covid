# == Schema Information
#
# Table name: lampiran_eleven_close_contact_informations
#
#  id                                     :bigint           not null, primary key
#  user_id                                :bigint
#  main_patient_id                        :bigint
#  main_public_health_center_id           :bigint
#  fill_in_date                           :date
#  contact_tracking_date                  :date
#  contact_with_positive_case             :string
#  placement                              :text
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#  slug                                   :string
#  deleted_at                             :datetime
#  telegram_message_closecont_reporter_id :bigint
#
class LampiranEleven::CloseContactInformation < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId


  scope :this_day, -> { where(fill_in_date: Date.today) }
  scope :this_month, -> { where(fill_in_date: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :newest_first, -> { order(created_at: :desc) }

  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  has_one :information_expose, class_name: 'LampiranEleven::InformationExpose', foreign_key: :lampiran_eleven_close_contact_information_id, dependent: :destroy
  has_one :info_exposes_officer, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :lampiran_eleven_close_contact_information_id, dependent: :destroy
  has_one :comorbid_condition, class_name: 'LampiranEleven::ComorbidCondition', foreign_key: :lampiran_eleven_close_contact_information_id, dependent: :destroy
  has_one :contact_status, class_name: 'LampiranEleven::ContactStatus', foreign_key: :lampiran_eleven_close_contact_information_id, dependent: :destroy
  has_one :specimen_contact, class_name: 'LampiranEleven::SpecimenContact', foreign_key: :lampiran_eleven_close_contact_information_id, dependent: :destroy

  belongs_to :message_closecont_reporter, class_name: 'Telegram::MessageClosecontReporter', foreign_key: :telegram_message_closecont_reporter_id, optional: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :patient, class_name: 'Main::Patient', foreign_key: :main_patient_id
  belongs_to :public_health_center, class_name: 'Main::PublicHealthCenter', foreign_key: :main_public_health_center_id

  def user
    User.unscoped {super}
  end

  def patient
    Main::Patient.unscoped {super}
  end

  def public_health_center
    Main::PublicHealthCenter.unscoped {super}
  end
  
end
