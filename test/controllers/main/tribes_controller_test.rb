require 'test_helper'

class Main::TribesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_tribe = main_tribes(:one)
  end

  test "should get index" do
    get main_tribes_url
    assert_response :success
  end

  test "should get new" do
    get new_main_tribe_url
    assert_response :success
  end

  test "should create main_tribe" do
    assert_difference('Main::Tribe.count') do
      post main_tribes_url, params: { main_tribe: { tribe: @main_tribe.tribe } }
    end

    assert_redirected_to main_tribe_url(Main::Tribe.last)
  end

  test "should show main_tribe" do
    get main_tribe_url(@main_tribe)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_tribe_url(@main_tribe)
    assert_response :success
  end

  test "should update main_tribe" do
    patch main_tribe_url(@main_tribe), params: { main_tribe: { tribe: @main_tribe.tribe } }
    assert_redirected_to main_tribe_url(@main_tribe)
  end

  test "should destroy main_tribe" do
    assert_difference('Main::Tribe.count', -1) do
      delete main_tribe_url(@main_tribe)
    end

    assert_redirected_to main_tribes_url
  end
end
