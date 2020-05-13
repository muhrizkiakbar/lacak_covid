require 'test_helper'

class LampiranEleven::CloseContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_close_contact = lampiran_eleven_close_contacts(:one)
  end

  test "should get index" do
    get lampiran_eleven_close_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_close_contact_url
    assert_response :success
  end

  test "should create lampiran_eleven_close_contact" do
    assert_difference('LampiranEleven::CloseContact.count') do
      post lampiran_eleven_close_contacts_url, params: { lampiran_eleven_close_contact: { address_job: @lampiran_eleven_close_contact.address_job, date_question_number_1: @lampiran_eleven_close_contact.date_question_number_1, date_question_number_2: @lampiran_eleven_close_contact.date_question_number_2, date_question_number_3: @lampiran_eleven_close_contact.date_question_number_3, end_travel_qn_1_id: @lampiran_eleven_close_contact.end_travel_qn_1_id, end_travel_qn_2_id: @lampiran_eleven_close_contact.end_travel_qn_2_id, lampiran_eleven_information_expose_id: @lampiran_eleven_close_contact.lampiran_eleven_information_expose_id, main_job_type_id: @lampiran_eleven_close_contact.main_job_type_id, main_transportation_id: @lampiran_eleven_close_contact.main_transportation_id, other_job_type: @lampiran_eleven_close_contact.other_job_type, other_transportation: @lampiran_eleven_close_contact.other_transportation, question_number_1: @lampiran_eleven_close_contact.question_number_1, question_number_2: @lampiran_eleven_close_contact.question_number_2, question_number_3: @lampiran_eleven_close_contact.question_number_3, start_travel_qn_1_id: @lampiran_eleven_close_contact.start_travel_qn_1_id, start_travel_qn_2_id: @lampiran_eleven_close_contact.start_travel_qn_2_id } }
    end

    assert_redirected_to lampiran_eleven_close_contact_url(LampiranEleven::CloseContact.last)
  end

  test "should show lampiran_eleven_close_contact" do
    get lampiran_eleven_close_contact_url(@lampiran_eleven_close_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_close_contact_url(@lampiran_eleven_close_contact)
    assert_response :success
  end

  test "should update lampiran_eleven_close_contact" do
    patch lampiran_eleven_close_contact_url(@lampiran_eleven_close_contact), params: { lampiran_eleven_close_contact: { address_job: @lampiran_eleven_close_contact.address_job, date_question_number_1: @lampiran_eleven_close_contact.date_question_number_1, date_question_number_2: @lampiran_eleven_close_contact.date_question_number_2, date_question_number_3: @lampiran_eleven_close_contact.date_question_number_3, end_travel_qn_1_id: @lampiran_eleven_close_contact.end_travel_qn_1_id, end_travel_qn_2_id: @lampiran_eleven_close_contact.end_travel_qn_2_id, lampiran_eleven_information_expose_id: @lampiran_eleven_close_contact.lampiran_eleven_information_expose_id, main_job_type_id: @lampiran_eleven_close_contact.main_job_type_id, main_transportation_id: @lampiran_eleven_close_contact.main_transportation_id, other_job_type: @lampiran_eleven_close_contact.other_job_type, other_transportation: @lampiran_eleven_close_contact.other_transportation, question_number_1: @lampiran_eleven_close_contact.question_number_1, question_number_2: @lampiran_eleven_close_contact.question_number_2, question_number_3: @lampiran_eleven_close_contact.question_number_3, start_travel_qn_1_id: @lampiran_eleven_close_contact.start_travel_qn_1_id, start_travel_qn_2_id: @lampiran_eleven_close_contact.start_travel_qn_2_id } }
    assert_redirected_to lampiran_eleven_close_contact_url(@lampiran_eleven_close_contact)
  end

  test "should destroy lampiran_eleven_close_contact" do
    assert_difference('LampiranEleven::CloseContact.count', -1) do
      delete lampiran_eleven_close_contact_url(@lampiran_eleven_close_contact)
    end

    assert_redirected_to lampiran_eleven_close_contacts_url
  end
end
