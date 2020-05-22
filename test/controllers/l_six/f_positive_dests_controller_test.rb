require 'test_helper'

class LSix::FPositiveDestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_f_positive_dest = l_six_f_positive_dests(:one)
  end

  test "should get index" do
    get l_six_f_positive_dests_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_f_positive_dest_url
    assert_response :success
  end

  test "should create l_six_f_positive_dest" do
    assert_difference('LSix::FPositiveDest.count') do
      post l_six_f_positive_dests_url, params: { l_six_f_positive_dest: { address: @l_six_f_positive_dest.address, date_contact: @l_six_f_positive_dest.date_contact, last_date_contact: @l_six_f_positive_dest.last_date_contact, name: @l_six_f_positive_dest.name, relation: @l_six_f_positive_dest.relation } }
    end

    assert_redirected_to l_six_f_positive_dest_url(LSix::FPositiveDest.last)
  end

  test "should show l_six_f_positive_dest" do
    get l_six_f_positive_dest_url(@l_six_f_positive_dest)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_f_positive_dest_url(@l_six_f_positive_dest)
    assert_response :success
  end

  test "should update l_six_f_positive_dest" do
    patch l_six_f_positive_dest_url(@l_six_f_positive_dest), params: { l_six_f_positive_dest: { address: @l_six_f_positive_dest.address, date_contact: @l_six_f_positive_dest.date_contact, last_date_contact: @l_six_f_positive_dest.last_date_contact, name: @l_six_f_positive_dest.name, relation: @l_six_f_positive_dest.relation } }
    assert_redirected_to l_six_f_positive_dest_url(@l_six_f_positive_dest)
  end

  test "should destroy l_six_f_positive_dest" do
    assert_difference('LSix::FPositiveDest.count', -1) do
      delete l_six_f_positive_dest_url(@l_six_f_positive_dest)
    end

    assert_redirected_to l_six_f_positive_dests_url
  end
end
