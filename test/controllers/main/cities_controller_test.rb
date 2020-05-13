require 'test_helper'

class Main::CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_city = main_cities(:one)
  end

  test "should get index" do
    get main_cities_url
    assert_response :success
  end

  test "should get new" do
    get new_main_city_url
    assert_response :success
  end

  test "should create main_city" do
    assert_difference('Main::City.count') do
      post main_cities_url, params: { main_city: { city: @main_city.city, main_province_id: @main_city.main_province_id } }
    end

    assert_redirected_to main_city_url(Main::City.last)
  end

  test "should show main_city" do
    get main_city_url(@main_city)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_city_url(@main_city)
    assert_response :success
  end

  test "should update main_city" do
    patch main_city_url(@main_city), params: { main_city: { city: @main_city.city, main_province_id: @main_city.main_province_id } }
    assert_redirected_to main_city_url(@main_city)
  end

  test "should destroy main_city" do
    assert_difference('Main::City.count', -1) do
      delete main_city_url(@main_city)
    end

    assert_redirected_to main_cities_url
  end
end
