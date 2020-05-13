require 'test_helper'

class Main::ProvincesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_province = main_provinces(:one)
  end

  test "should get index" do
    get main_provinces_url
    assert_response :success
  end

  test "should get new" do
    get new_main_province_url
    assert_response :success
  end

  test "should create main_province" do
    assert_difference('Main::Province.count') do
      post main_provinces_url, params: { main_province: { province: @main_province.province } }
    end

    assert_redirected_to main_province_url(Main::Province.last)
  end

  test "should show main_province" do
    get main_province_url(@main_province)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_province_url(@main_province)
    assert_response :success
  end

  test "should update main_province" do
    patch main_province_url(@main_province), params: { main_province: { province: @main_province.province } }
    assert_redirected_to main_province_url(@main_province)
  end

  test "should destroy main_province" do
    assert_difference('Main::Province.count', -1) do
      delete main_province_url(@main_province)
    end

    assert_redirected_to main_provinces_url
  end
end
