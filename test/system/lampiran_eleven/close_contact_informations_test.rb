require "application_system_test_case"

class LampiranEleven::CloseContactInformationsTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_close_contact_information = lampiran_eleven_close_contact_informations(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_close_contact_informations_url
    assert_selector "h1", text: "Lampiran Eleven/Close Contact Informations"
  end

  test "creating a Close contact information" do
    visit lampiran_eleven_close_contact_informations_url
    click_on "New Lampiran Eleven/Close Contact Information"

    fill_in "Contact tracking date", with: @lampiran_eleven_close_contact_information.contact_tracking_date
    fill_in "Contact with positive case", with: @lampiran_eleven_close_contact_information.contact_with_positive_case
    fill_in "Fill in date", with: @lampiran_eleven_close_contact_information.fill_in_date
    fill_in "Main patient", with: @lampiran_eleven_close_contact_information.main_patient_id
    fill_in "Main public health center", with: @lampiran_eleven_close_contact_information.main_public_health_center_id
    fill_in "Placement", with: @lampiran_eleven_close_contact_information.placement
    fill_in "User", with: @lampiran_eleven_close_contact_information.user_id
    click_on "Create Close contact information"

    assert_text "Close contact information was successfully created"
    click_on "Back"
  end

  test "updating a Close contact information" do
    visit lampiran_eleven_close_contact_informations_url
    click_on "Edit", match: :first

    fill_in "Contact tracking date", with: @lampiran_eleven_close_contact_information.contact_tracking_date
    fill_in "Contact with positive case", with: @lampiran_eleven_close_contact_information.contact_with_positive_case
    fill_in "Fill in date", with: @lampiran_eleven_close_contact_information.fill_in_date
    fill_in "Main patient", with: @lampiran_eleven_close_contact_information.main_patient_id
    fill_in "Main public health center", with: @lampiran_eleven_close_contact_information.main_public_health_center_id
    fill_in "Placement", with: @lampiran_eleven_close_contact_information.placement
    fill_in "User", with: @lampiran_eleven_close_contact_information.user_id
    click_on "Update Close contact information"

    assert_text "Close contact information was successfully updated"
    click_on "Back"
  end

  test "destroying a Close contact information" do
    visit lampiran_eleven_close_contact_informations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Close contact information was successfully destroyed"
  end
end
