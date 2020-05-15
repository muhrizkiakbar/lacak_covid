# == Schema Information
#
# Table name: lampiran_eleven_info_exposes_officers
#
#  id                                           :bigint           not null, primary key
#  lampiran_eleven_close_contact_information_id :bigint
#  main_dinkes_province_id                      :bigint
#  main_dinkes_region_id                        :bigint
#  main_hospital_id                             :bigint
#  main_public_health_center_id                 :bigint
#  is_contact_physic_with_positive              :boolean
#  is_procedure_aerosol                         :boolean
#  explain_of_procedure_aerosol                 :text
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  slug                                         :string
#  deleted_at                                   :datetime
#  main_job_position_id                         :bigint
#
class LampiranEleven::InfoExposesOfficer < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :close_contact_information, class_name: 'LampiranEleven::CloseContactInformation', foreign_key: :lampiran_eleven_close_contact_information_id

  belongs_to :dinkes_province, class_name: 'Main::DinkesProvince', foreign_key: :main_dinkes_province_id
  belongs_to :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id
  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id
  belongs_to :public_health_center, class_name: 'Main::PublicHealthCenter', foreign_key: :main_public_health_center_id


  has_one :contact_symptom, class_name: 'LampiranEleven::ContactSymptom', foreign_key: :lampiran_eleven_info_exposes_officer_id, dependent: :destroy
  has_one :respiratory_symptom, class_name: 'LampiranEleven::RespiratorySymptom', foreign_key: :lampiran_eleven_info_exposes_officer_id, dependent: :destroy
  has_one :other_symptom, class_name: 'LampiranEleven::OtherSymptom', foreign_key: :lampiran_eleven_info_exposes_officer_id, dependent: :destroy

  belongs_to :job_position, class_name: 'Main::JobPosition', foreign_key: :main_job_position_id
  
end
