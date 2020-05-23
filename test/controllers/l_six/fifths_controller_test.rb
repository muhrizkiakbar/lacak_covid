require 'test_helper'

class LSix::FifthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_fifth = l_six_fifths(:one)
  end

  test "should get index" do
    get l_six_fifths_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_fifth_url
    assert_response :success
  end

  test "should create l_six_fifth" do
    assert_difference('LSix::Fifth.count') do
      post l_six_fifths_url, params: { l_six_fifth: { activity: @l_six_fifth.activity, address: @l_six_fifth.address, date_of_birth: @l_six_fifth.date_of_birth, gender: @l_six_fifth.gender, l_six_first_id: @l_six_fifth.l_six_first_id, name: @l_six_fifth.name, phone_number: @l_six_fifth.phone_number, relation: @l_six_fifth.relation } }
    end

    assert_redirected_to l_six_fifth_url(LSix::Fifth.last)
  end

  test "should show l_six_fifth" do
    get l_six_fifth_url(@l_six_fifth)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_fifth_url(@l_six_fifth)
    assert_response :success
  end

  test "should update l_six_fifth" do
    patch l_six_fifth_url(@l_six_fifth), params: { l_six_fifth: { activity: @l_six_fifth.activity, address: @l_six_fifth.address, date_of_birth: @l_six_fifth.date_of_birth, gender: @l_six_fifth.gender, l_six_first_id: @l_six_fifth.l_six_first_id, name: @l_six_fifth.name, phone_number: @l_six_fifth.phone_number, relation: @l_six_fifth.relation } }
    assert_redirected_to l_six_fifth_url(@l_six_fifth)
  end

  test "should destroy l_six_fifth" do
    assert_difference('LSix::Fifth.count', -1) do
      delete l_six_fifth_url(@l_six_fifth)
    end

    assert_redirected_to l_six_fifths_url
  end
end
