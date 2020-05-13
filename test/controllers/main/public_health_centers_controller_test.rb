require 'test_helper'

class Main::PublicHealthCentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_public_health_center = main_public_health_centers(:one)
  end

  test "should get index" do
    get main_public_health_centers_url
    assert_response :success
  end

  test "should get new" do
    get new_main_public_health_center_url
    assert_response :success
  end

  test "should create main_public_health_center" do
    assert_difference('Main::PublicHealthCenter.count') do
      post main_public_health_centers_url, params: { main_public_health_center: { main_hospital_id: @main_public_health_center.main_hospital_id, public_health_center: @main_public_health_center.public_health_center } }
    end

    assert_redirected_to main_public_health_center_url(Main::PublicHealthCenter.last)
  end

  test "should show main_public_health_center" do
    get main_public_health_center_url(@main_public_health_center)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_public_health_center_url(@main_public_health_center)
    assert_response :success
  end

  test "should update main_public_health_center" do
    patch main_public_health_center_url(@main_public_health_center), params: { main_public_health_center: { main_hospital_id: @main_public_health_center.main_hospital_id, public_health_center: @main_public_health_center.public_health_center } }
    assert_redirected_to main_public_health_center_url(@main_public_health_center)
  end

  test "should destroy main_public_health_center" do
    assert_difference('Main::PublicHealthCenter.count', -1) do
      delete main_public_health_center_url(@main_public_health_center)
    end

    assert_redirected_to main_public_health_centers_url
  end
end
