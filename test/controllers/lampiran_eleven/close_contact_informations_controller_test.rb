require 'test_helper'

class LampiranEleven::CloseContactInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_close_contact_information = lampiran_eleven_close_contact_informations(:one)
  end

  test "should get index" do
    get lampiran_eleven_close_contact_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_close_contact_information_url
    assert_response :success
  end

  test "should create lampiran_eleven_close_contact_information" do
    assert_difference('LampiranEleven::CloseContactInformation.count') do
      post lampiran_eleven_close_contact_informations_url, params: { lampiran_eleven_close_contact_information: { contact_tracking_date: @lampiran_eleven_close_contact_information.contact_tracking_date, contact_with_positive_case: @lampiran_eleven_close_contact_information.contact_with_positive_case, fill_in_date: @lampiran_eleven_close_contact_information.fill_in_date, main_patient_id: @lampiran_eleven_close_contact_information.main_patient_id, main_public_health_center_id: @lampiran_eleven_close_contact_information.main_public_health_center_id, placement: @lampiran_eleven_close_contact_information.placement, user_id: @lampiran_eleven_close_contact_information.user_id } }
    end

    assert_redirected_to lampiran_eleven_close_contact_information_url(LampiranEleven::CloseContactInformation.last)
  end

  test "should show lampiran_eleven_close_contact_information" do
    get lampiran_eleven_close_contact_information_url(@lampiran_eleven_close_contact_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_close_contact_information_url(@lampiran_eleven_close_contact_information)
    assert_response :success
  end

  test "should update lampiran_eleven_close_contact_information" do
    patch lampiran_eleven_close_contact_information_url(@lampiran_eleven_close_contact_information), params: { lampiran_eleven_close_contact_information: { contact_tracking_date: @lampiran_eleven_close_contact_information.contact_tracking_date, contact_with_positive_case: @lampiran_eleven_close_contact_information.contact_with_positive_case, fill_in_date: @lampiran_eleven_close_contact_information.fill_in_date, main_patient_id: @lampiran_eleven_close_contact_information.main_patient_id, main_public_health_center_id: @lampiran_eleven_close_contact_information.main_public_health_center_id, placement: @lampiran_eleven_close_contact_information.placement, user_id: @lampiran_eleven_close_contact_information.user_id } }
    assert_redirected_to lampiran_eleven_close_contact_information_url(@lampiran_eleven_close_contact_information)
  end

  test "should destroy lampiran_eleven_close_contact_information" do
    assert_difference('LampiranEleven::CloseContactInformation.count', -1) do
      delete lampiran_eleven_close_contact_information_url(@lampiran_eleven_close_contact_information)
    end

    assert_redirected_to lampiran_eleven_close_contact_informations_url
  end
end
