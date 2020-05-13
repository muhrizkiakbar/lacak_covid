require 'test_helper'

class Main::HospitalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_hospital = main_hospitals(:one)
  end

  test "should get index" do
    get main_hospitals_url
    assert_response :success
  end

  test "should get new" do
    get new_main_hospital_url
    assert_response :success
  end

  test "should create main_hospital" do
    assert_difference('Main::Hospital.count') do
      post main_hospitals_url, params: { main_hospital: { hospital: @main_hospital.hospital, is_primary: @main_hospital.is_primary, main_dinkes_region_id: @main_hospital.main_dinkes_region_id } }
    end

    assert_redirected_to main_hospital_url(Main::Hospital.last)
  end

  test "should show main_hospital" do
    get main_hospital_url(@main_hospital)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_hospital_url(@main_hospital)
    assert_response :success
  end

  test "should update main_hospital" do
    patch main_hospital_url(@main_hospital), params: { main_hospital: { hospital: @main_hospital.hospital, is_primary: @main_hospital.is_primary, main_dinkes_region_id: @main_hospital.main_dinkes_region_id } }
    assert_redirected_to main_hospital_url(@main_hospital)
  end

  test "should destroy main_hospital" do
    assert_difference('Main::Hospital.count', -1) do
      delete main_hospital_url(@main_hospital)
    end

    assert_redirected_to main_hospitals_url
  end
end
