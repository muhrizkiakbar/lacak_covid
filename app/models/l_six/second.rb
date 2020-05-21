class LSix::Second < ApplicationRecord
  acts_as_paranoid
  extend FriendlyId
  

  scope :this_month, -> { where(interview_date: Time.now.beginning_of_month..Time.now.end_of_month) }

  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  
  # has_one :first, class_name: 'LSix::Second', foreign_key: :l_six_first_id, dependent: :destroy

  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id
  belongs_to :first, class_name: 'LSix::First', foreign_key: :main_patient_id
end
