require 'test_helper'

class LSix::FAnimalDestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_f_animal_dest = l_six_f_animal_dests(:one)
  end

  test "should get index" do
    get l_six_f_animal_dests_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_f_animal_dest_url
    assert_response :success
  end

  test "should create l_six_f_animal_dest" do
    assert_difference('LSix::FAnimalDest.count') do
      post l_six_f_animal_dests_url, params: { l_six_f_animal_dest: { city: @l_six_f_animal_dest.city, location: @l_six_f_animal_dest.location, province_city: @l_six_f_animal_dest.province_city, visit_date: @l_six_f_animal_dest.visit_date } }
    end

    assert_redirected_to l_six_f_animal_dest_url(LSix::FAnimalDest.last)
  end

  test "should show l_six_f_animal_dest" do
    get l_six_f_animal_dest_url(@l_six_f_animal_dest)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_f_animal_dest_url(@l_six_f_animal_dest)
    assert_response :success
  end

  test "should update l_six_f_animal_dest" do
    patch l_six_f_animal_dest_url(@l_six_f_animal_dest), params: { l_six_f_animal_dest: { city: @l_six_f_animal_dest.city, location: @l_six_f_animal_dest.location, province_city: @l_six_f_animal_dest.province_city, visit_date: @l_six_f_animal_dest.visit_date } }
    assert_redirected_to l_six_f_animal_dest_url(@l_six_f_animal_dest)
  end

  test "should destroy l_six_f_animal_dest" do
    assert_difference('LSix::FAnimalDest.count', -1) do
      delete l_six_f_animal_dest_url(@l_six_f_animal_dest)
    end

    assert_redirected_to l_six_f_animal_dests_url
  end
end
