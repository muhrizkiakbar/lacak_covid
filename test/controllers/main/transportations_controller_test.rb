require 'test_helper'

class Main::TransportationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_transportation = main_transportations(:one)
  end

  test "should get index" do
    get main_transportations_url
    assert_response :success
  end

  test "should get new" do
    get new_main_transportation_url
    assert_response :success
  end

  test "should create main_transportation" do
    assert_difference('Main::Transportation.count') do
      post main_transportations_url, params: { main_transportation: { transportation: @main_transportation.transportation } }
    end

    assert_redirected_to main_transportation_url(Main::Transportation.last)
  end

  test "should show main_transportation" do
    get main_transportation_url(@main_transportation)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_transportation_url(@main_transportation)
    assert_response :success
  end

  test "should update main_transportation" do
    patch main_transportation_url(@main_transportation), params: { main_transportation: { transportation: @main_transportation.transportation } }
    assert_redirected_to main_transportation_url(@main_transportation)
  end

  test "should destroy main_transportation" do
    assert_difference('Main::Transportation.count', -1) do
      delete main_transportation_url(@main_transportation)
    end

    assert_redirected_to main_transportations_url
  end
end
