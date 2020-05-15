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
require 'test_helper'

class LampiranEleven::InfoExposesOfficerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
