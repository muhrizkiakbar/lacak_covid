require 'test_helper'

class Main::PhcOfSdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_phc_of_sd = main_phc_of_sds(:one)
  end

  test "should get index" do
    get main_phc_of_sds_url
    assert_response :success
  end

  test "should get new" do
    get new_main_phc_of_sd_url
    assert_response :success
  end

  test "should create main_phc_of_sd" do
    assert_difference('Main::PhcOfSd.count') do
      post main_phc_of_sds_url, params: { main_phc_of_sd: { main_public_health_center_id: @main_phc_of_sd.main_public_health_center_id, main_sub_district_id: @main_phc_of_sd.main_sub_district_id } }
    end

    assert_redirected_to main_phc_of_sd_url(Main::PhcOfSd.last)
  end

  test "should show main_phc_of_sd" do
    get main_phc_of_sd_url(@main_phc_of_sd)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_phc_of_sd_url(@main_phc_of_sd)
    assert_response :success
  end

  test "should update main_phc_of_sd" do
    patch main_phc_of_sd_url(@main_phc_of_sd), params: { main_phc_of_sd: { main_public_health_center_id: @main_phc_of_sd.main_public_health_center_id, main_sub_district_id: @main_phc_of_sd.main_sub_district_id } }
    assert_redirected_to main_phc_of_sd_url(@main_phc_of_sd)
  end

  test "should destroy main_phc_of_sd" do
    assert_difference('Main::PhcOfSd.count', -1) do
      delete main_phc_of_sd_url(@main_phc_of_sd)
    end

    assert_redirected_to main_phc_of_sds_url
  end
end
