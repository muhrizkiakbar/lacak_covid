require 'test_helper'

class Main::SetLocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_set_location = main_set_locations(:one)
  end

  test "should get index" do
    get main_set_locations_url
    assert_response :success
  end

  test "should get new" do
    get new_main_set_location_url
    assert_response :success
  end

  test "should create main_set_location" do
    assert_difference('Main::SetLocation.count') do
      post main_set_locations_url, params: { main_set_location: { set_location: @main_set_location.set_location } }
    end

    assert_redirected_to main_set_location_url(Main::SetLocation.last)
  end

  test "should show main_set_location" do
    get main_set_location_url(@main_set_location)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_set_location_url(@main_set_location)
    assert_response :success
  end

  test "should update main_set_location" do
    patch main_set_location_url(@main_set_location), params: { main_set_location: { set_location: @main_set_location.set_location } }
    assert_redirected_to main_set_location_url(@main_set_location)
  end

  test "should destroy main_set_location" do
    assert_difference('Main::SetLocation.count', -1) do
      delete main_set_location_url(@main_set_location)
    end

    assert_redirected_to main_set_locations_url
  end
end
