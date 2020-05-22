require 'test_helper'

class LSix::FPdpDestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_f_pdp_dest = l_six_f_pdp_dests(:one)
  end

  test "should get index" do
    get l_six_f_pdp_dests_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_f_pdp_dest_url
    assert_response :success
  end

  test "should create l_six_f_pdp_dest" do
    assert_difference('LSix::FPdpDest.count') do
      post l_six_f_pdp_dests_url, params: { l_six_f_pdp_dest: { address: @l_six_f_pdp_dest.address, date_contact: @l_six_f_pdp_dest.date_contact, last_date_contact: @l_six_f_pdp_dest.last_date_contact, name: @l_six_f_pdp_dest.name, relation: @l_six_f_pdp_dest.relation } }
    end

    assert_redirected_to l_six_f_pdp_dest_url(LSix::FPdpDest.last)
  end

  test "should show l_six_f_pdp_dest" do
    get l_six_f_pdp_dest_url(@l_six_f_pdp_dest)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_f_pdp_dest_url(@l_six_f_pdp_dest)
    assert_response :success
  end

  test "should update l_six_f_pdp_dest" do
    patch l_six_f_pdp_dest_url(@l_six_f_pdp_dest), params: { l_six_f_pdp_dest: { address: @l_six_f_pdp_dest.address, date_contact: @l_six_f_pdp_dest.date_contact, last_date_contact: @l_six_f_pdp_dest.last_date_contact, name: @l_six_f_pdp_dest.name, relation: @l_six_f_pdp_dest.relation } }
    assert_redirected_to l_six_f_pdp_dest_url(@l_six_f_pdp_dest)
  end

  test "should destroy l_six_f_pdp_dest" do
    assert_difference('LSix::FPdpDest.count', -1) do
      delete l_six_f_pdp_dest_url(@l_six_f_pdp_dest)
    end

    assert_redirected_to l_six_f_pdp_dests_url
  end
end
