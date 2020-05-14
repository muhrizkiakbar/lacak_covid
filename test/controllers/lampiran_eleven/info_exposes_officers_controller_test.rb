require 'test_helper'

class LampiranEleven::InfoExposesOfficersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_info_exposes_officer = lampiran_eleven_info_exposes_officers(:one)
  end

  test "should get index" do
    get lampiran_eleven_info_exposes_officers_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_info_exposes_officer_url
    assert_response :success
  end

  test "should create lampiran_eleven_info_exposes_officer" do
    assert_difference('LampiranEleven::InfoExposesOfficer.count') do
      post lampiran_eleven_info_exposes_officers_url, params: { lampiran_eleven_info_exposes_officer: { explain_of_procedure_aerosol: @lampiran_eleven_info_exposes_officer.explain_of_procedure_aerosol, is_contact_physic_with_positive: @lampiran_eleven_info_exposes_officer.is_contact_physic_with_positive, is_procedure_aerosol: @lampiran_eleven_info_exposes_officer.is_procedure_aerosol, lampiran_eleven_close_contact_information_id: @lampiran_eleven_info_exposes_officer.lampiran_eleven_close_contact_information_id, main_dinkes_province_id: @lampiran_eleven_info_exposes_officer.main_dinkes_province_id, main_dinkes_region_id: @lampiran_eleven_info_exposes_officer.main_dinkes_region_id, main_hospital_id: @lampiran_eleven_info_exposes_officer.main_hospital_id, main_public_health_center_id: @lampiran_eleven_info_exposes_officer.main_public_health_center_id } }
    end

    assert_redirected_to lampiran_eleven_info_exposes_officer_url(LampiranEleven::InfoExposesOfficer.last)
  end

  test "should show lampiran_eleven_info_exposes_officer" do
    get lampiran_eleven_info_exposes_officer_url(@lampiran_eleven_info_exposes_officer)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_info_exposes_officer_url(@lampiran_eleven_info_exposes_officer)
    assert_response :success
  end

  test "should update lampiran_eleven_info_exposes_officer" do
    patch lampiran_eleven_info_exposes_officer_url(@lampiran_eleven_info_exposes_officer), params: { lampiran_eleven_info_exposes_officer: { explain_of_procedure_aerosol: @lampiran_eleven_info_exposes_officer.explain_of_procedure_aerosol, is_contact_physic_with_positive: @lampiran_eleven_info_exposes_officer.is_contact_physic_with_positive, is_procedure_aerosol: @lampiran_eleven_info_exposes_officer.is_procedure_aerosol, lampiran_eleven_close_contact_information_id: @lampiran_eleven_info_exposes_officer.lampiran_eleven_close_contact_information_id, main_dinkes_province_id: @lampiran_eleven_info_exposes_officer.main_dinkes_province_id, main_dinkes_region_id: @lampiran_eleven_info_exposes_officer.main_dinkes_region_id, main_hospital_id: @lampiran_eleven_info_exposes_officer.main_hospital_id, main_public_health_center_id: @lampiran_eleven_info_exposes_officer.main_public_health_center_id } }
    assert_redirected_to lampiran_eleven_info_exposes_officer_url(@lampiran_eleven_info_exposes_officer)
  end

  test "should destroy lampiran_eleven_info_exposes_officer" do
    assert_difference('LampiranEleven::InfoExposesOfficer.count', -1) do
      delete lampiran_eleven_info_exposes_officer_url(@lampiran_eleven_info_exposes_officer)
    end

    assert_redirected_to lampiran_eleven_info_exposes_officers_url
  end
end
