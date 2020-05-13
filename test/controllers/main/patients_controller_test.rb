require 'test_helper'

class Main::PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_patient = main_patients(:one)
  end

  test "should get index" do
    get main_patients_url
    assert_response :success
  end

  test "should get new" do
    get new_main_patient_url
    assert_response :success
  end

  test "should create main_patient" do
    assert_difference('Main::Patient.count') do
      post main_patients_url, params: { main_patient: { address: @main_patient.address, date_of_birth: @main_patient.date_of_birth, gender: @main_patient.gender, main_citizen_association_id: @main_patient.main_citizen_association_id, main_city_id: @main_patient.main_city_id, main_district_id: @main_patient.main_district_id, main_marital_status_id: @main_patient.main_marital_status_id, main_neighborhood_association_id: @main_patient.main_neighborhood_association_id, main_sub_district_id: @main_patient.main_sub_district_id, main_tribe_id: @main_patient.main_tribe_id, name: @main_patient.name, name_of_parent: @main_patient.name_of_parent, no_identity: @main_patient.no_identity, phone_number: @main_patient.phone_number } }
    end

    assert_redirected_to main_patient_url(Main::Patient.last)
  end

  test "should show main_patient" do
    get main_patient_url(@main_patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_patient_url(@main_patient)
    assert_response :success
  end

  test "should update main_patient" do
    patch main_patient_url(@main_patient), params: { main_patient: { address: @main_patient.address, date_of_birth: @main_patient.date_of_birth, gender: @main_patient.gender, main_citizen_association_id: @main_patient.main_citizen_association_id, main_city_id: @main_patient.main_city_id, main_district_id: @main_patient.main_district_id, main_marital_status_id: @main_patient.main_marital_status_id, main_neighborhood_association_id: @main_patient.main_neighborhood_association_id, main_sub_district_id: @main_patient.main_sub_district_id, main_tribe_id: @main_patient.main_tribe_id, name: @main_patient.name, name_of_parent: @main_patient.name_of_parent, no_identity: @main_patient.no_identity, phone_number: @main_patient.phone_number } }
    assert_redirected_to main_patient_url(@main_patient)
  end

  test "should destroy main_patient" do
    assert_difference('Main::Patient.count', -1) do
      delete main_patient_url(@main_patient)
    end

    assert_redirected_to main_patients_url
  end
end
