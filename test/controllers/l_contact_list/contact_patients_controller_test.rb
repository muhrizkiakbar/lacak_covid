require 'test_helper'

class LContactList::ContactPatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_contact_list_contact_patient = l_contact_list_contact_patients(:one)
  end

  test "should get index" do
    get l_contact_list_contact_patients_url
    assert_response :success
  end

  test "should get new" do
    get new_l_contact_list_contact_patient_url
    assert_response :success
  end

  test "should create l_contact_list_contact_patient" do
    assert_difference('LContactList::ContactPatient.count') do
      post l_contact_list_contact_patients_url, params: { l_contact_list_contact_patient: { main_patient_child_id: @l_contact_list_contact_patient.main_patient_child_id, main_patient_id: @l_contact_list_contact_patient.main_patient_id } }
    end

    assert_redirected_to l_contact_list_contact_patient_url(LContactList::ContactPatient.last)
  end

  test "should show l_contact_list_contact_patient" do
    get l_contact_list_contact_patient_url(@l_contact_list_contact_patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_contact_list_contact_patient_url(@l_contact_list_contact_patient)
    assert_response :success
  end

  test "should update l_contact_list_contact_patient" do
    patch l_contact_list_contact_patient_url(@l_contact_list_contact_patient), params: { l_contact_list_contact_patient: { main_patient_child_id: @l_contact_list_contact_patient.main_patient_child_id, main_patient_id: @l_contact_list_contact_patient.main_patient_id } }
    assert_redirected_to l_contact_list_contact_patient_url(@l_contact_list_contact_patient)
  end

  test "should destroy l_contact_list_contact_patient" do
    assert_difference('LContactList::ContactPatient.count', -1) do
      delete l_contact_list_contact_patient_url(@l_contact_list_contact_patient)
    end

    assert_redirected_to l_contact_list_contact_patients_url
  end
end
