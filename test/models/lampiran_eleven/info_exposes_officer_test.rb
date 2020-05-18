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
require 'test_helper'

class LampiranEleven::InfoExposesOfficerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
