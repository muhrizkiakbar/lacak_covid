require "application_system_test_case"

class LampiranEleven::CloseContactInfoHomesTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_close_contact_info_home = lampiran_eleven_close_contact_info_homes(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_close_contact_info_homes_url
    assert_selector "h1", text: "Lampiran Eleven/Close Contact Info Homes"
  end

  test "creating a Close contact info home" do
    visit lampiran_eleven_close_contact_info_homes_url
    click_on "New Lampiran Eleven/Close Contact Info Home"

    fill_in "Address close contact primer", with: @lampiran_eleven_close_contact_info_home.address_close_contact_primer
    check "Is drink using the same place" if @lampiran_eleven_close_contact_info_home.is_drink_using_the_same_place
    check "Is eat using the same place" if @lampiran_eleven_close_contact_info_home.is_eat_using_the_same_place
    check "Is hugging the primary case" if @lampiran_eleven_close_contact_info_home.is_hugging_the_primary_case
    check "Is kiss the primary case" if @lampiran_eleven_close_contact_info_home.is_kiss_the_primary_case
    check "Is primary case shake" if @lampiran_eleven_close_contact_info_home.is_primary_case_shake
    check "Is room contact or activity" if @lampiran_eleven_close_contact_info_home.is_room_contact_or_activity
    check "Is sleep in the same room" if @lampiran_eleven_close_contact_info_home.is_sleep_in_the_same_room
    check "Is treating primary case" if @lampiran_eleven_close_contact_info_home.is_treating_primary_case
    check "Is use the same toilet" if @lampiran_eleven_close_contact_info_home.is_use_the_same_toilet
    check "Is using the same equipment" if @lampiran_eleven_close_contact_info_home.is_using_the_same_equipment
    fill_in "Lampiran eleven information expose", with: @lampiran_eleven_close_contact_info_home.lampiran_eleven_information_expose_id
    fill_in "Last date close contact primer", with: @lampiran_eleven_close_contact_info_home.last_date_close_contact_primer
    fill_in "Number of days of contact activity", with: @lampiran_eleven_close_contact_info_home.number_of_days_of_contact_activity
    click_on "Create Close contact info home"

    assert_text "Close contact info home was successfully created"
    click_on "Back"
  end

  test "updating a Close contact info home" do
    visit lampiran_eleven_close_contact_info_homes_url
    click_on "Edit", match: :first

    fill_in "Address close contact primer", with: @lampiran_eleven_close_contact_info_home.address_close_contact_primer
    check "Is drink using the same place" if @lampiran_eleven_close_contact_info_home.is_drink_using_the_same_place
    check "Is eat using the same place" if @lampiran_eleven_close_contact_info_home.is_eat_using_the_same_place
    check "Is hugging the primary case" if @lampiran_eleven_close_contact_info_home.is_hugging_the_primary_case
    check "Is kiss the primary case" if @lampiran_eleven_close_contact_info_home.is_kiss_the_primary_case
    check "Is primary case shake" if @lampiran_eleven_close_contact_info_home.is_primary_case_shake
    check "Is room contact or activity" if @lampiran_eleven_close_contact_info_home.is_room_contact_or_activity
    check "Is sleep in the same room" if @lampiran_eleven_close_contact_info_home.is_sleep_in_the_same_room
    check "Is treating primary case" if @lampiran_eleven_close_contact_info_home.is_treating_primary_case
    check "Is use the same toilet" if @lampiran_eleven_close_contact_info_home.is_use_the_same_toilet
    check "Is using the same equipment" if @lampiran_eleven_close_contact_info_home.is_using_the_same_equipment
    fill_in "Lampiran eleven information expose", with: @lampiran_eleven_close_contact_info_home.lampiran_eleven_information_expose_id
    fill_in "Last date close contact primer", with: @lampiran_eleven_close_contact_info_home.last_date_close_contact_primer
    fill_in "Number of days of contact activity", with: @lampiran_eleven_close_contact_info_home.number_of_days_of_contact_activity
    click_on "Update Close contact info home"

    assert_text "Close contact info home was successfully updated"
    click_on "Back"
  end

  test "destroying a Close contact info home" do
    visit lampiran_eleven_close_contact_info_homes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Close contact info home was successfully destroyed"
  end
end
