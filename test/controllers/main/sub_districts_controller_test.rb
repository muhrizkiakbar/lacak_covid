require 'test_helper'

class Main::SubDistrictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_sub_district = main_sub_districts(:one)
  end

  test "should get index" do
    get main_sub_districts_url
    assert_response :success
  end

  test "should get new" do
    get new_main_sub_district_url
    assert_response :success
  end

  test "should create main_sub_district" do
    assert_difference('Main::SubDistrict.count') do
      post main_sub_districts_url, params: { main_sub_district: { main_district_id: @main_sub_district.main_district_id, sub_district: @main_sub_district.sub_district } }
    end

    assert_redirected_to main_sub_district_url(Main::SubDistrict.last)
  end

  test "should show main_sub_district" do
    get main_sub_district_url(@main_sub_district)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_sub_district_url(@main_sub_district)
    assert_response :success
  end

  test "should update main_sub_district" do
    patch main_sub_district_url(@main_sub_district), params: { main_sub_district: { main_district_id: @main_sub_district.main_district_id, sub_district: @main_sub_district.sub_district } }
    assert_redirected_to main_sub_district_url(@main_sub_district)
  end

  test "should destroy main_sub_district" do
    assert_difference('Main::SubDistrict.count', -1) do
      delete main_sub_district_url(@main_sub_district)
    end

    assert_redirected_to main_sub_districts_url
  end
end
