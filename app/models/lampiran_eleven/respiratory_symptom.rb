class LampiranEleven::RespiratorySymptom < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :info_exposes_officer, class_name: 'LampiranEleven::InfoExposesOfficer', foreign_key: :lampiran_eleven_info_exposes_officer_id
end
