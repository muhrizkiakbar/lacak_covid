require 'test_helper'

class Main::DistrictsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_district = main_districts(:one)
  end

  test "should get index" do
    get main_districts_url
    assert_response :success
  end

  test "should get new" do
    get new_main_district_url
    assert_response :success
  end

  test "should create main_district" do
    assert_difference('Main::District.count') do
      post main_districts_url, params: { main_district: { district: @main_district.district, main_city_id: @main_district.main_city_id } }
    end

    assert_redirected_to main_district_url(Main::District.last)
  end

  test "should show main_district" do
    get main_district_url(@main_district)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_district_url(@main_district)
    assert_response :success
  end

  test "should update main_district" do
    patch main_district_url(@main_district), params: { main_district: { district: @main_district.district, main_city_id: @main_district.main_city_id } }
    assert_redirected_to main_district_url(@main_district)
  end

  test "should destroy main_district" do
    assert_difference('Main::District.count', -1) do
      delete main_district_url(@main_district)
    end

    assert_redirected_to main_districts_url
  end
end
