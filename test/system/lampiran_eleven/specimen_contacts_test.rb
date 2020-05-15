require "application_system_test_case"

class LampiranEleven::SpecimenContactsTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_specimen_contact = lampiran_eleven_specimen_contacts(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_specimen_contacts_url
    assert_selector "h1", text: "Lampiran Eleven/Specimen Contacts"
  end

  test "creating a Specimen contact" do
    visit lampiran_eleven_specimen_contacts_url
    click_on "New Lampiran Eleven/Specimen Contact"

    fill_in "Date of specimen collection", with: @lampiran_eleven_specimen_contact.date_of_specimen_collection
    fill_in "Laboratory examination results", with: @lampiran_eleven_specimen_contact.laboratory_examination_results
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_specimen_contact.lampiran_eleven_close_contact_information_id
    check "Type of specimen" if @lampiran_eleven_specimen_contact.type_of_specimen
    click_on "Create Specimen contact"

    assert_text "Specimen contact was successfully created"
    click_on "Back"
  end

  test "updating a Specimen contact" do
    visit lampiran_eleven_specimen_contacts_url
    click_on "Edit", match: :first

    fill_in "Date of specimen collection", with: @lampiran_eleven_specimen_contact.date_of_specimen_collection
    fill_in "Laboratory examination results", with: @lampiran_eleven_specimen_contact.laboratory_examination_results
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_specimen_contact.lampiran_eleven_close_contact_information_id
    check "Type of specimen" if @lampiran_eleven_specimen_contact.type_of_specimen
    click_on "Update Specimen contact"

    assert_text "Specimen contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Specimen contact" do
    visit lampiran_eleven_specimen_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Specimen contact was successfully destroyed"
  end
end
