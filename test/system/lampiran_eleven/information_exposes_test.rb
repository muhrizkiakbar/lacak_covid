require "application_system_test_case"

class LampiranEleven::InformationExposesTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_information_expose = lampiran_eleven_information_exposes(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_information_exposes_url
    assert_selector "h1", text: "Lampiran Eleven/Information Exposes"
  end

  test "creating a Information expose" do
    visit lampiran_eleven_information_exposes_url
    click_on "New Lampiran Eleven/Information Expose"

    fill_in "Date contact", with: @lampiran_eleven_information_expose.date_contact
    fill_in "Duration contact", with: @lampiran_eleven_information_expose.duration_contact
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_information_expose.lampiran_eleven_close_contact_information_id
    fill_in "Main set location", with: @lampiran_eleven_information_expose.main_set_location_id
    fill_in "Main type contact", with: @lampiran_eleven_information_expose.main_type_contact_id
    fill_in "Other set location", with: @lampiran_eleven_information_expose.other_set_location
    fill_in "Other type contact", with: @lampiran_eleven_information_expose.other_type_contact
    click_on "Create Information expose"

    assert_text "Information expose was successfully created"
    click_on "Back"
  end

  test "updating a Information expose" do
    visit lampiran_eleven_information_exposes_url
    click_on "Edit", match: :first

    fill_in "Date contact", with: @lampiran_eleven_information_expose.date_contact
    fill_in "Duration contact", with: @lampiran_eleven_information_expose.duration_contact
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_information_expose.lampiran_eleven_close_contact_information_id
    fill_in "Main set location", with: @lampiran_eleven_information_expose.main_set_location_id
    fill_in "Main type contact", with: @lampiran_eleven_information_expose.main_type_contact_id
    fill_in "Other set location", with: @lampiran_eleven_information_expose.other_set_location
    fill_in "Other type contact", with: @lampiran_eleven_information_expose.other_type_contact
    click_on "Update Information expose"

    assert_text "Information expose was successfully updated"
    click_on "Back"
  end

  test "destroying a Information expose" do
    visit lampiran_eleven_information_exposes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Information expose was successfully destroyed"
  end
end
