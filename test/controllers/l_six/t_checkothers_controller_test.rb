require 'test_helper'

class LSix::TCheckothersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_t_checkother = l_six_t_checkothers(:one)
  end

  test "should get index" do
    get l_six_t_checkothers_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_t_checkother_url
    assert_response :success
  end

  test "should create l_six_t_checkother" do
    assert_difference('LSix::TCheckother.count') do
      post l_six_t_checkothers_url, params: { l_six_t_checkother: { date_check_other: @l_six_t_checkother.date_check_other, l_six_third_id: @l_six_t_checkother.l_six_third_id, other_check: @l_six_t_checkother.other_check, place_check_other: @l_six_t_checkother.place_check_other, result_check_other: @l_six_t_checkother.result_check_other } }
    end

    assert_redirected_to l_six_t_checkother_url(LSix::TCheckother.last)
  end

  test "should show l_six_t_checkother" do
    get l_six_t_checkother_url(@l_six_t_checkother)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_t_checkother_url(@l_six_t_checkother)
    assert_response :success
  end

  test "should update l_six_t_checkother" do
    patch l_six_t_checkother_url(@l_six_t_checkother), params: { l_six_t_checkother: { date_check_other: @l_six_t_checkother.date_check_other, l_six_third_id: @l_six_t_checkother.l_six_third_id, other_check: @l_six_t_checkother.other_check, place_check_other: @l_six_t_checkother.place_check_other, result_check_other: @l_six_t_checkother.result_check_other } }
    assert_redirected_to l_six_t_checkother_url(@l_six_t_checkother)
  end

  test "should destroy l_six_t_checkother" do
    assert_difference('LSix::TCheckother.count', -1) do
      delete l_six_t_checkother_url(@l_six_t_checkother)
    end

    assert_redirected_to l_six_t_checkothers_url
  end
end
