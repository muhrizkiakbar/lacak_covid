require 'test_helper'

class LSix::FirstsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_first = l_six_firsts(:one)
  end

  test "should get index" do
    get l_six_firsts_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_first_url
    assert_response :success
  end

  test "should create l_six_first" do
    assert_difference('LSix::First.count') do
      post l_six_firsts_url, params: { l_six_first: { interview_date: @l_six_first.interview_date, main_patient_id: @l_six_first.main_patient_id, user_id: @l_six_first.user_id } }
    end

    assert_redirected_to l_six_first_url(LSix::First.last)
  end

  test "should show l_six_first" do
    get l_six_first_url(@l_six_first)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_first_url(@l_six_first)
    assert_response :success
  end

  test "should update l_six_first" do
    patch l_six_first_url(@l_six_first), params: { l_six_first: { interview_date: @l_six_first.interview_date, main_patient_id: @l_six_first.main_patient_id, user_id: @l_six_first.user_id } }
    assert_redirected_to l_six_first_url(@l_six_first)
  end

  test "should destroy l_six_first" do
    assert_difference('LSix::First.count', -1) do
      delete l_six_first_url(@l_six_first)
    end

    assert_redirected_to l_six_firsts_url
  end
end
