# == Schema Information
#
# Table name: l_six_firsts
#
#  id                               :bigint           not null, primary key
#  main_patient_id                  :bigint
#  user_id                          :bigint
#  interview_date                   :date
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  deleted_at                       :datetime
#  slug                             :string
#  job                              :string
#  telegram_message_ili_reporter_id :bigint
#  criteria                         :string
#
class LSix::First < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId
  
  enum criteria: {"Pasien Dalam Pengawasan" => "pdp", "Orang Dalam Pengawasan" => "odp", "Kasus Probabel" => "kp", "Kasus Konfirmasi" => "kk", "Selesai Pemantauan" => "selesai"}

  scope :this_day, -> { where(interview_date: Date.today) }
  scope :this_month, -> { where(interview_date: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :newest_first, -> { order(created_at: :asc) }
  scope :count_odp, -> { where(criteria: "Orang Dalam Pengawasan").count }
  scope :count_pdp, -> { where(criteria: "Pasien Dalam Pengawasan").count }
  scope :count_kp, -> { where(criteria: "Kasus Probabel").count }
  scope :count_kk, -> { where(criteria: "Kasus Konfirmasi").count }
  scope :count_done, -> { where(criteria: "Selesai Pemantauan").count }

  scope :lastest_by_patient, -> do
    first_ids_hash = LSix::First.group(:main_patient_id).maximum(:id)
    first_ids = first_ids_hash.values
    where(id: first_ids)
  end
  

  def self.search options
    self.ransack(options)
  end

  def self.count_covered_of_hospital
    self.joins(:ls_second).where("l_six_seconds.last_status_patient = ?", "Sembuh").count
  end

  def self.count_sick_of_hospital
    self.joins(:ls_second).where("l_six_seconds.last_status_patient = ?",  "Masih Sakit").count
  end

  def self.count_died_of_hospital
    self.joins(:ls_second).where("l_six_seconds.last_status_patient = ?",  "Meninggal Dunia").count
  end

  friendly_id :slug_candidates, use: :slugged
  
  has_one :ls_second, class_name: 'LSix::Second', foreign_key: :l_six_first_id, dependent: :destroy
  has_one :ls_third, class_name: 'LSix::Third', foreign_key: :l_six_first_id, dependent: :destroy
  has_one :ls_fourth, class_name: 'LSix::Fourth', foreign_key: :l_six_first_id, dependent: :destroy
  has_many :ls_fifths, class_name: 'LSix::Fifth', foreign_key: :l_six_first_id, dependent: :destroy

  belongs_to :message_ili_reporter, class_name: 'Telegram::MessageIliReporter', foreign_key: :telegram_message_ili_reporter_id, optional: true
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :patient, class_name: 'Main::Patient', foreign_key: :main_patient_id


  def user
    User.unscoped {super}
  end

  def message_ili_reporter
    Telegram::MessageIliReporter.unscoped {super}
  end

  def patient
    Main::Patient.unscoped {super}
  end
  
end
