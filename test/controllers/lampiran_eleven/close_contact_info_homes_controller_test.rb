require 'test_helper'

class LampiranEleven::CloseContactInfoHomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_close_contact_info_home = lampiran_eleven_close_contact_info_homes(:one)
  end

  test "should get index" do
    get lampiran_eleven_close_contact_info_homes_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_close_contact_info_home_url
    assert_response :success
  end

  test "should create lampiran_eleven_close_contact_info_home" do
    assert_difference('LampiranEleven::CloseContactInfoHome.count') do
      post lampiran_eleven_close_contact_info_homes_url, params: { lampiran_eleven_close_contact_info_home: { address_close_contact_primer: @lampiran_eleven_close_contact_info_home.address_close_contact_primer, is_drink_using_the_same_place: @lampiran_eleven_close_contact_info_home.is_drink_using_the_same_place, is_eat_using_the_same_place: @lampiran_eleven_close_contact_info_home.is_eat_using_the_same_place, is_hugging_the_primary_case: @lampiran_eleven_close_contact_info_home.is_hugging_the_primary_case, is_kiss_the_primary_case: @lampiran_eleven_close_contact_info_home.is_kiss_the_primary_case, is_primary_case_shake: @lampiran_eleven_close_contact_info_home.is_primary_case_shake, is_room_contact_or_activity: @lampiran_eleven_close_contact_info_home.is_room_contact_or_activity, is_sleep_in_the_same_room: @lampiran_eleven_close_contact_info_home.is_sleep_in_the_same_room, is_treating_primary_case: @lampiran_eleven_close_contact_info_home.is_treating_primary_case, is_use_the_same_toilet: @lampiran_eleven_close_contact_info_home.is_use_the_same_toilet, is_using_the_same_equipment: @lampiran_eleven_close_contact_info_home.is_using_the_same_equipment, lampiran_eleven_information_expose_id: @lampiran_eleven_close_contact_info_home.lampiran_eleven_information_expose_id, last_date_close_contact_primer: @lampiran_eleven_close_contact_info_home.last_date_close_contact_primer, number_of_days_of_contact_activity: @lampiran_eleven_close_contact_info_home.number_of_days_of_contact_activity } }
    end

    assert_redirected_to lampiran_eleven_close_contact_info_home_url(LampiranEleven::CloseContactInfoHome.last)
  end

  test "should show lampiran_eleven_close_contact_info_home" do
    get lampiran_eleven_close_contact_info_home_url(@lampiran_eleven_close_contact_info_home)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_close_contact_info_home_url(@lampiran_eleven_close_contact_info_home)
    assert_response :success
  end

  test "should update lampiran_eleven_close_contact_info_home" do
    patch lampiran_eleven_close_contact_info_home_url(@lampiran_eleven_close_contact_info_home), params: { lampiran_eleven_close_contact_info_home: { address_close_contact_primer: @lampiran_eleven_close_contact_info_home.address_close_contact_primer, is_drink_using_the_same_place: @lampiran_eleven_close_contact_info_home.is_drink_using_the_same_place, is_eat_using_the_same_place: @lampiran_eleven_close_contact_info_home.is_eat_using_the_same_place, is_hugging_the_primary_case: @lampiran_eleven_close_contact_info_home.is_hugging_the_primary_case, is_kiss_the_primary_case: @lampiran_eleven_close_contact_info_home.is_kiss_the_primary_case, is_primary_case_shake: @lampiran_eleven_close_contact_info_home.is_primary_case_shake, is_room_contact_or_activity: @lampiran_eleven_close_contact_info_home.is_room_contact_or_activity, is_sleep_in_the_same_room: @lampiran_eleven_close_contact_info_home.is_sleep_in_the_same_room, is_treating_primary_case: @lampiran_eleven_close_contact_info_home.is_treating_primary_case, is_use_the_same_toilet: @lampiran_eleven_close_contact_info_home.is_use_the_same_toilet, is_using_the_same_equipment: @lampiran_eleven_close_contact_info_home.is_using_the_same_equipment, lampiran_eleven_information_expose_id: @lampiran_eleven_close_contact_info_home.lampiran_eleven_information_expose_id, last_date_close_contact_primer: @lampiran_eleven_close_contact_info_home.last_date_close_contact_primer, number_of_days_of_contact_activity: @lampiran_eleven_close_contact_info_home.number_of_days_of_contact_activity } }
    assert_redirected_to lampiran_eleven_close_contact_info_home_url(@lampiran_eleven_close_contact_info_home)
  end

  test "should destroy lampiran_eleven_close_contact_info_home" do
    assert_difference('LampiranEleven::CloseContactInfoHome.count', -1) do
      delete lampiran_eleven_close_contact_info_home_url(@lampiran_eleven_close_contact_info_home)
    end

    assert_redirected_to lampiran_eleven_close_contact_info_homes_url
  end
end
