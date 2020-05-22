require 'test_helper'

class LSix::FOutTownDestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_f_out_town_dest = l_six_f_out_town_dests(:one)
  end

  test "should get index" do
    get l_six_f_out_town_dests_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_f_out_town_dest_url
    assert_response :success
  end

  test "should create l_six_f_out_town_dest" do
    assert_difference('LSix::FOutTownDest.count') do
      post l_six_f_out_town_dests_url, params: { l_six_f_out_town_dest: { city: @l_six_f_out_town_dest.city, date_arrive: @l_six_f_out_town_dest.date_arrive, province: @l_six_f_out_town_dest.province, travel_date: @l_six_f_out_town_dest.travel_date } }
    end

    assert_redirected_to l_six_f_out_town_dest_url(LSix::FOutTownDest.last)
  end

  test "should show l_six_f_out_town_dest" do
    get l_six_f_out_town_dest_url(@l_six_f_out_town_dest)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_f_out_town_dest_url(@l_six_f_out_town_dest)
    assert_response :success
  end

  test "should update l_six_f_out_town_dest" do
    patch l_six_f_out_town_dest_url(@l_six_f_out_town_dest), params: { l_six_f_out_town_dest: { city: @l_six_f_out_town_dest.city, date_arrive: @l_six_f_out_town_dest.date_arrive, province: @l_six_f_out_town_dest.province, travel_date: @l_six_f_out_town_dest.travel_date } }
    assert_redirected_to l_six_f_out_town_dest_url(@l_six_f_out_town_dest)
  end

  test "should destroy l_six_f_out_town_dest" do
    assert_difference('LSix::FOutTownDest.count', -1) do
      delete l_six_f_out_town_dest_url(@l_six_f_out_town_dest)
    end

    assert_redirected_to l_six_f_out_town_dests_url
  end
end
