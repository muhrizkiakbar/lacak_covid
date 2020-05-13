require 'test_helper'

class Main::MaritalStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_marital_status = main_marital_statuses(:one)
  end

  test "should get index" do
    get main_marital_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_main_marital_status_url
    assert_response :success
  end

  test "should create main_marital_status" do
    assert_difference('Main::MaritalStatus.count') do
      post main_marital_statuses_url, params: { main_marital_status: { marital_status: @main_marital_status.marital_status } }
    end

    assert_redirected_to main_marital_status_url(Main::MaritalStatus.last)
  end

  test "should show main_marital_status" do
    get main_marital_status_url(@main_marital_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_marital_status_url(@main_marital_status)
    assert_response :success
  end

  test "should update main_marital_status" do
    patch main_marital_status_url(@main_marital_status), params: { main_marital_status: { marital_status: @main_marital_status.marital_status } }
    assert_redirected_to main_marital_status_url(@main_marital_status)
  end

  test "should destroy main_marital_status" do
    assert_difference('Main::MaritalStatus.count', -1) do
      delete main_marital_status_url(@main_marital_status)
    end

    assert_redirected_to main_marital_statuses_url
  end
end
