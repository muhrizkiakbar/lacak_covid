require "application_system_test_case"

class LampiranEleven::ContactStatusesTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_contact_status = lampiran_eleven_contact_statuses(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_contact_statuses_url
    assert_selector "h1", text: "Lampiran Eleven/Contact Statuses"
  end

  test "creating a Contact status" do
    visit lampiran_eleven_contact_statuses_url
    click_on "New Lampiran Eleven/Contact Status"

    fill_in "Date of status died", with: @lampiran_eleven_contact_status.date_of_status_died
    fill_in "Date of status recovered", with: @lampiran_eleven_contact_status.date_of_status_recovered
    fill_in "End date of treated", with: @lampiran_eleven_contact_status.end_date_of_treated
    check "Is been treated" if @lampiran_eleven_contact_status.is_been_treated
    check "Is dead with autopsy" if @lampiran_eleven_contact_status.is_dead_with_autopsy
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_contact_status.lampiran_eleven_close_contact_information_id
    fill_in "Result of autopsy", with: @lampiran_eleven_contact_status.result_of_autopsy
    fill_in "Start date of treated", with: @lampiran_eleven_contact_status.start_date_of_treated
    fill_in "Status patient", with: @lampiran_eleven_contact_status.status_patient
    click_on "Create Contact status"

    assert_text "Contact status was successfully created"
    click_on "Back"
  end

  test "updating a Contact status" do
    visit lampiran_eleven_contact_statuses_url
    click_on "Edit", match: :first

    fill_in "Date of status died", with: @lampiran_eleven_contact_status.date_of_status_died
    fill_in "Date of status recovered", with: @lampiran_eleven_contact_status.date_of_status_recovered
    fill_in "End date of treated", with: @lampiran_eleven_contact_status.end_date_of_treated
    check "Is been treated" if @lampiran_eleven_contact_status.is_been_treated
    check "Is dead with autopsy" if @lampiran_eleven_contact_status.is_dead_with_autopsy
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_contact_status.lampiran_eleven_close_contact_information_id
    fill_in "Result of autopsy", with: @lampiran_eleven_contact_status.result_of_autopsy
    fill_in "Start date of treated", with: @lampiran_eleven_contact_status.start_date_of_treated
    fill_in "Status patient", with: @lampiran_eleven_contact_status.status_patient
    click_on "Update Contact status"

    assert_text "Contact status was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact status" do
    visit lampiran_eleven_contact_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact status was successfully destroyed"
  end
end
