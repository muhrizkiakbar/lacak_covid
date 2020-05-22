require 'test_helper'

class LSix::FHospitalDestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_f_hospital_dest = l_six_f_hospital_dests(:one)
  end

  test "should get index" do
    get l_six_f_hospital_dests_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_f_hospital_dest_url
    assert_response :success
  end

  test "should create l_six_f_hospital_dest" do
    assert_difference('LSix::FHospitalDest.count') do
      post l_six_f_hospital_dests_url, params: { l_six_f_hospital_dest: { city: @l_six_f_hospital_dest.city, hospital: @l_six_f_hospital_dest.hospital, province_city: @l_six_f_hospital_dest.province_city, visit_date: @l_six_f_hospital_dest.visit_date } }
    end

    assert_redirected_to l_six_f_hospital_dest_url(LSix::FHospitalDest.last)
  end

  test "should show l_six_f_hospital_dest" do
    get l_six_f_hospital_dest_url(@l_six_f_hospital_dest)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_f_hospital_dest_url(@l_six_f_hospital_dest)
    assert_response :success
  end

  test "should update l_six_f_hospital_dest" do
    patch l_six_f_hospital_dest_url(@l_six_f_hospital_dest), params: { l_six_f_hospital_dest: { city: @l_six_f_hospital_dest.city, hospital: @l_six_f_hospital_dest.hospital, province_city: @l_six_f_hospital_dest.province_city, visit_date: @l_six_f_hospital_dest.visit_date } }
    assert_redirected_to l_six_f_hospital_dest_url(@l_six_f_hospital_dest)
  end

  test "should destroy l_six_f_hospital_dest" do
    assert_difference('LSix::FHospitalDest.count', -1) do
      delete l_six_f_hospital_dest_url(@l_six_f_hospital_dest)
    end

    assert_redirected_to l_six_f_hospital_dests_url
  end
end
