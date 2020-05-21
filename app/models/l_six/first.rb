class LSix::First < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId
  

  scope :this_month, -> { where(interview_date: Time.now.beginning_of_month..Time.now.end_of_month) }

  def self.search options
    self.ransack(options)
  end

  friendly_id :slug_candidates, use: :slugged
  
  has_one :ls_second, class_name: 'LSix::Second', foreign_key: :l_six_second_id, dependent: :destroy
  has_one :ls_third, class_name: 'LSix::Third', foreign_key: :l_six_third_id, dependent: :destroy

  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :patient, class_name: 'Main::Patient', foreign_key: :main_patient_id
end
