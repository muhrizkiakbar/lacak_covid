require 'test_helper'

class LampiranEleven::InformationExposesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_information_expose = lampiran_eleven_information_exposes(:one)
  end

  test "should get index" do
    get lampiran_eleven_information_exposes_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_information_expose_url
    assert_response :success
  end

  test "should create lampiran_eleven_information_expose" do
    assert_difference('LampiranEleven::InformationExpose.count') do
      post lampiran_eleven_information_exposes_url, params: { lampiran_eleven_information_expose: { date_contact: @lampiran_eleven_information_expose.date_contact, duration_contact: @lampiran_eleven_information_expose.duration_contact, lampiran_eleven_close_contact_information_id: @lampiran_eleven_information_expose.lampiran_eleven_close_contact_information_id, main_set_location_id: @lampiran_eleven_information_expose.main_set_location_id, main_type_contact_id: @lampiran_eleven_information_expose.main_type_contact_id, other_set_location: @lampiran_eleven_information_expose.other_set_location, other_type_contact: @lampiran_eleven_information_expose.other_type_contact } }
    end

    assert_redirected_to lampiran_eleven_information_expose_url(LampiranEleven::InformationExpose.last)
  end

  test "should show lampiran_eleven_information_expose" do
    get lampiran_eleven_information_expose_url(@lampiran_eleven_information_expose)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_information_expose_url(@lampiran_eleven_information_expose)
    assert_response :success
  end

  test "should update lampiran_eleven_information_expose" do
    patch lampiran_eleven_information_expose_url(@lampiran_eleven_information_expose), params: { lampiran_eleven_information_expose: { date_contact: @lampiran_eleven_information_expose.date_contact, duration_contact: @lampiran_eleven_information_expose.duration_contact, lampiran_eleven_close_contact_information_id: @lampiran_eleven_information_expose.lampiran_eleven_close_contact_information_id, main_set_location_id: @lampiran_eleven_information_expose.main_set_location_id, main_type_contact_id: @lampiran_eleven_information_expose.main_type_contact_id, other_set_location: @lampiran_eleven_information_expose.other_set_location, other_type_contact: @lampiran_eleven_information_expose.other_type_contact } }
    assert_redirected_to lampiran_eleven_information_expose_url(@lampiran_eleven_information_expose)
  end

  test "should destroy lampiran_eleven_information_expose" do
    assert_difference('LampiranEleven::InformationExpose.count', -1) do
      delete lampiran_eleven_information_expose_url(@lampiran_eleven_information_expose)
    end

    assert_redirected_to lampiran_eleven_information_exposes_url
  end
end
