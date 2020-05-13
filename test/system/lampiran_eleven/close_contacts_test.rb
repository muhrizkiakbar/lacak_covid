require "application_system_test_case"

class LampiranEleven::CloseContactsTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_close_contact = lampiran_eleven_close_contacts(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_close_contacts_url
    assert_selector "h1", text: "Lampiran Eleven/Close Contacts"
  end

  test "creating a Close contact" do
    visit lampiran_eleven_close_contacts_url
    click_on "New Lampiran Eleven/Close Contact"

    fill_in "Address job", with: @lampiran_eleven_close_contact.address_job
    fill_in "Date question number 1", with: @lampiran_eleven_close_contact.date_question_number_1
    fill_in "Date question number 2", with: @lampiran_eleven_close_contact.date_question_number_2
    fill_in "Date question number 3", with: @lampiran_eleven_close_contact.date_question_number_3
    fill_in "End travel qn 1", with: @lampiran_eleven_close_contact.end_travel_qn_1_id
    fill_in "End travel qn 2", with: @lampiran_eleven_close_contact.end_travel_qn_2_id
    fill_in "Lampiran eleven information expose", with: @lampiran_eleven_close_contact.lampiran_eleven_information_expose_id
    fill_in "Main job type", with: @lampiran_eleven_close_contact.main_job_type_id
    fill_in "Main transportation", with: @lampiran_eleven_close_contact.main_transportation_id
    fill_in "Other job type", with: @lampiran_eleven_close_contact.other_job_type
    fill_in "Other transportation", with: @lampiran_eleven_close_contact.other_transportation
    check "Question number 1" if @lampiran_eleven_close_contact.question_number_1
    check "Question number 2" if @lampiran_eleven_close_contact.question_number_2
    check "Question number 3" if @lampiran_eleven_close_contact.question_number_3
    fill_in "Start travel qn 1", with: @lampiran_eleven_close_contact.start_travel_qn_1_id
    fill_in "Start travel qn 2", with: @lampiran_eleven_close_contact.start_travel_qn_2_id
    click_on "Create Close contact"

    assert_text "Close contact was successfully created"
    click_on "Back"
  end

  test "updating a Close contact" do
    visit lampiran_eleven_close_contacts_url
    click_on "Edit", match: :first

    fill_in "Address job", with: @lampiran_eleven_close_contact.address_job
    fill_in "Date question number 1", with: @lampiran_eleven_close_contact.date_question_number_1
    fill_in "Date question number 2", with: @lampiran_eleven_close_contact.date_question_number_2
    fill_in "Date question number 3", with: @lampiran_eleven_close_contact.date_question_number_3
    fill_in "End travel qn 1", with: @lampiran_eleven_close_contact.end_travel_qn_1_id
    fill_in "End travel qn 2", with: @lampiran_eleven_close_contact.end_travel_qn_2_id
    fill_in "Lampiran eleven information expose", with: @lampiran_eleven_close_contact.lampiran_eleven_information_expose_id
    fill_in "Main job type", with: @lampiran_eleven_close_contact.main_job_type_id
    fill_in "Main transportation", with: @lampiran_eleven_close_contact.main_transportation_id
    fill_in "Other job type", with: @lampiran_eleven_close_contact.other_job_type
    fill_in "Other transportation", with: @lampiran_eleven_close_contact.other_transportation
    check "Question number 1" if @lampiran_eleven_close_contact.question_number_1
    check "Question number 2" if @lampiran_eleven_close_contact.question_number_2
    check "Question number 3" if @lampiran_eleven_close_contact.question_number_3
    fill_in "Start travel qn 1", with: @lampiran_eleven_close_contact.start_travel_qn_1_id
    fill_in "Start travel qn 2", with: @lampiran_eleven_close_contact.start_travel_qn_2_id
    click_on "Update Close contact"

    assert_text "Close contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Close contact" do
    visit lampiran_eleven_close_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Close contact was successfully destroyed"
  end
end
