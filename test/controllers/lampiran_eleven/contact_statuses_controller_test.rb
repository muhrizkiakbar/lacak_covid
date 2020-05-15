require 'test_helper'

class LampiranEleven::ContactStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_contact_status = lampiran_eleven_contact_statuses(:one)
  end

  test "should get index" do
    get lampiran_eleven_contact_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_contact_status_url
    assert_response :success
  end

  test "should create lampiran_eleven_contact_status" do
    assert_difference('LampiranEleven::ContactStatus.count') do
      post lampiran_eleven_contact_statuses_url, params: { lampiran_eleven_contact_status: { date_of_status_died: @lampiran_eleven_contact_status.date_of_status_died, date_of_status_recovered: @lampiran_eleven_contact_status.date_of_status_recovered, end_date_of_treated: @lampiran_eleven_contact_status.end_date_of_treated, is_been_treated: @lampiran_eleven_contact_status.is_been_treated, is_dead_with_autopsy: @lampiran_eleven_contact_status.is_dead_with_autopsy, lampiran_eleven_close_contact_information_id: @lampiran_eleven_contact_status.lampiran_eleven_close_contact_information_id, result_of_autopsy: @lampiran_eleven_contact_status.result_of_autopsy, start_date_of_treated: @lampiran_eleven_contact_status.start_date_of_treated, status_patient: @lampiran_eleven_contact_status.status_patient } }
    end

    assert_redirected_to lampiran_eleven_contact_status_url(LampiranEleven::ContactStatus.last)
  end

  test "should show lampiran_eleven_contact_status" do
    get lampiran_eleven_contact_status_url(@lampiran_eleven_contact_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_contact_status_url(@lampiran_eleven_contact_status)
    assert_response :success
  end

  test "should update lampiran_eleven_contact_status" do
    patch lampiran_eleven_contact_status_url(@lampiran_eleven_contact_status), params: { lampiran_eleven_contact_status: { date_of_status_died: @lampiran_eleven_contact_status.date_of_status_died, date_of_status_recovered: @lampiran_eleven_contact_status.date_of_status_recovered, end_date_of_treated: @lampiran_eleven_contact_status.end_date_of_treated, is_been_treated: @lampiran_eleven_contact_status.is_been_treated, is_dead_with_autopsy: @lampiran_eleven_contact_status.is_dead_with_autopsy, lampiran_eleven_close_contact_information_id: @lampiran_eleven_contact_status.lampiran_eleven_close_contact_information_id, result_of_autopsy: @lampiran_eleven_contact_status.result_of_autopsy, start_date_of_treated: @lampiran_eleven_contact_status.start_date_of_treated, status_patient: @lampiran_eleven_contact_status.status_patient } }
    assert_redirected_to lampiran_eleven_contact_status_url(@lampiran_eleven_contact_status)
  end

  test "should destroy lampiran_eleven_contact_status" do
    assert_difference('LampiranEleven::ContactStatus.count', -1) do
      delete lampiran_eleven_contact_status_url(@lampiran_eleven_contact_status)
    end

    assert_redirected_to lampiran_eleven_contact_statuses_url
  end
end
