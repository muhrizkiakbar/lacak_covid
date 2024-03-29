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
#  is_gown_self                                 :boolean
#  is_medic_mask_self                           :boolean
#  is_gloves_self                               :boolean
#  is_n95_ffp2_self                             :boolean
#  is_n99_ffp3_self                             :boolean
#  is_goggle_self                               :boolean
#  isn_apd_self                                 :boolean
#  is_gown_aerosol                              :boolean
#  is_medic_mask_aerosol                        :boolean
#  is_gloves_aerosol                            :boolean
#  is_n95_ffp2_aerosol                          :boolean
#  is_n99_ffp3_aerosol                          :boolean
#  is_goggle_aerosol                            :boolean
#  isn_apd_aerosol                              :boolean
#
class LampiranEleven::InfoExposesOfficer < ApplicationRecord

  acts_as_paranoid
  extend FriendlyId

  friendly_id :slug_candidates, use: :slugged
  
  belongs_to :close_contact_information, class_name: 'LampiranEleven::CloseContactInformation', foreign_key: :lampiran_eleven_close_contact_information_id

  belongs_to :dinkes_province, class_name: 'Main::DinkesProvince', foreign_key: :main_dinkes_province_id, optional: true
  belongs_to :dinkes_region, class_name: 'Main::DinkesRegion', foreign_key: :main_dinkes_region_id, optional: true
  belongs_to :hospital, class_name: 'Main::Hospital', foreign_key: :main_hospital_id, optional: true
  belongs_to :public_health_center, class_name: 'Main::PublicHealthCenter', foreign_key: :main_public_health_center_id, optional: true


  has_one :contact_symptom, class_name: 'LampiranEleven::ContactSymptom', foreign_key: :lampiran_eleven_info_exposes_officer_id, dependent: :destroy
  has_one :respiratory_symptom, class_name: 'LampiranEleven::RespiratorySymptom', foreign_key: :lampiran_eleven_info_exposes_officer_id, dependent: :destroy
  has_one :other_symptom, class_name: 'LampiranEleven::OtherSymptom', foreign_key: :lampiran_eleven_info_exposes_officer_id, dependent: :destroy

  belongs_to :job_position, class_name: 'Main::JobPosition', foreign_key: :main_job_position_id, optional: true
  
end
