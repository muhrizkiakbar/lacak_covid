require 'test_helper'

class Main::JobPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_job_position = main_job_positions(:one)
  end

  test "should get index" do
    get main_job_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_main_job_position_url
    assert_response :success
  end

  test "should create main_job_position" do
    assert_difference('Main::JobPosition.count') do
      post main_job_positions_url, params: { main_job_position: { job_position: @main_job_position.job_position } }
    end

    assert_redirected_to main_job_position_url(Main::JobPosition.last)
  end

  test "should show main_job_position" do
    get main_job_position_url(@main_job_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_job_position_url(@main_job_position)
    assert_response :success
  end

  test "should update main_job_position" do
    patch main_job_position_url(@main_job_position), params: { main_job_position: { job_position: @main_job_position.job_position } }
    assert_redirected_to main_job_position_url(@main_job_position)
  end

  test "should destroy main_job_position" do
    assert_difference('Main::JobPosition.count', -1) do
      delete main_job_position_url(@main_job_position)
    end

    assert_redirected_to main_job_positions_url
  end
end
