require 'test_helper'

class LSix::ThirdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_third = l_six_thirds(:one)
  end

  test "should get index" do
    get l_six_thirds_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_third_url
    assert_response :success
  end

  test "should create l_six_third" do
    assert_difference('LSix::Third.count') do
      post l_six_thirds_url, params: { l_six_third: { date_nasopharyngeal: @l_six_third.date_nasopharyngeal, date_oropharyngeal: @l_six_third.date_oropharyngeal, date_serum: @l_six_third.date_serum, date_sputum: @l_six_third.date_sputum, l_six_third_id: @l_six_third.l_six_third_id, place_nasopharyngeal: @l_six_third.place_nasopharyngeal, place_oropharyngeal: @l_six_third.place_oropharyngeal, place_serum: @l_six_third.place_serum, place_sputum: @l_six_third.place_sputum, result_nasopharyngeal: @l_six_third.result_nasopharyngeal, result_oropharyngeal: @l_six_third.result_oropharyngeal, result_serum: @l_six_third.result_serum, result_sputum: @l_six_third.result_sputum } }
    end

    assert_redirected_to l_six_third_url(LSix::Third.last)
  end

  test "should show l_six_third" do
    get l_six_third_url(@l_six_third)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_third_url(@l_six_third)
    assert_response :success
  end

  test "should update l_six_third" do
    patch l_six_third_url(@l_six_third), params: { l_six_third: { date_nasopharyngeal: @l_six_third.date_nasopharyngeal, date_oropharyngeal: @l_six_third.date_oropharyngeal, date_serum: @l_six_third.date_serum, date_sputum: @l_six_third.date_sputum, l_six_third_id: @l_six_third.l_six_third_id, place_nasopharyngeal: @l_six_third.place_nasopharyngeal, place_oropharyngeal: @l_six_third.place_oropharyngeal, place_serum: @l_six_third.place_serum, place_sputum: @l_six_third.place_sputum, result_nasopharyngeal: @l_six_third.result_nasopharyngeal, result_oropharyngeal: @l_six_third.result_oropharyngeal, result_serum: @l_six_third.result_serum, result_sputum: @l_six_third.result_sputum } }
    assert_redirected_to l_six_third_url(@l_six_third)
  end

  test "should destroy l_six_third" do
    assert_difference('LSix::Third.count', -1) do
      delete l_six_third_url(@l_six_third)
    end

    assert_redirected_to l_six_thirds_url
  end
end
