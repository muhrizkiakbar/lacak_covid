class LampiranEleven::CloseContactInformation < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  has_one :information_expose, class_name: 'LampiranEleven::InformationExpose', foreign_key: :lampiran_eleven_close_contact_information_id

  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :patient, class_name: 'Main::Patient', foreign_key: :main_patient_id
  belongs_to :public_health_center, class_name: 'Main::PublicHealthCenter', foreign_key: :main_public_health_center_id
end
