require 'test_helper'

class Main::JobTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_job_type = main_job_types(:one)
  end

  test "should get index" do
    get main_job_types_url
    assert_response :success
  end

  test "should get new" do
    get new_main_job_type_url
    assert_response :success
  end

  test "should create main_job_type" do
    assert_difference('Main::JobType.count') do
      post main_job_types_url, params: { main_job_type: { job_type: @main_job_type.job_type } }
    end

    assert_redirected_to main_job_type_url(Main::JobType.last)
  end

  test "should show main_job_type" do
    get main_job_type_url(@main_job_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_job_type_url(@main_job_type)
    assert_response :success
  end

  test "should update main_job_type" do
    patch main_job_type_url(@main_job_type), params: { main_job_type: { job_type: @main_job_type.job_type } }
    assert_redirected_to main_job_type_url(@main_job_type)
  end

  test "should destroy main_job_type" do
    assert_difference('Main::JobType.count', -1) do
      delete main_job_type_url(@main_job_type)
    end

    assert_redirected_to main_job_types_url
  end
end
