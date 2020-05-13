require 'test_helper'

class Main::DinkesProvincesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_dinkes_province = main_dinkes_provinces(:one)
  end

  test "should get index" do
    get main_dinkes_provinces_url
    assert_response :success
  end

  test "should get new" do
    get new_main_dinkes_province_url
    assert_response :success
  end

  test "should create main_dinkes_province" do
    assert_difference('Main::DinkesProvince.count') do
      post main_dinkes_provinces_url, params: { main_dinkes_province: { dinkes_province: @main_dinkes_province.dinkes_province } }
    end

    assert_redirected_to main_dinkes_province_url(Main::DinkesProvince.last)
  end

  test "should show main_dinkes_province" do
    get main_dinkes_province_url(@main_dinkes_province)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_dinkes_province_url(@main_dinkes_province)
    assert_response :success
  end

  test "should update main_dinkes_province" do
    patch main_dinkes_province_url(@main_dinkes_province), params: { main_dinkes_province: { dinkes_province: @main_dinkes_province.dinkes_province } }
    assert_redirected_to main_dinkes_province_url(@main_dinkes_province)
  end

  test "should destroy main_dinkes_province" do
    assert_difference('Main::DinkesProvince.count', -1) do
      delete main_dinkes_province_url(@main_dinkes_province)
    end

    assert_redirected_to main_dinkes_provinces_url
  end
end
