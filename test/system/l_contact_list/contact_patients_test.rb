require "application_system_test_case"

class LContactList::ContactPatientsTest < ApplicationSystemTestCase
  setup do
    @l_contact_list_contact_patient = l_contact_list_contact_patients(:one)
  end

  test "visiting the index" do
    visit l_contact_list_contact_patients_url
    assert_selector "h1", text: "L Contact List/Contact Patients"
  end

  test "creating a Contact patient" do
    visit l_contact_list_contact_patients_url
    click_on "New L Contact List/Contact Patient"

    fill_in "Main patient child", with: @l_contact_list_contact_patient.main_patient_child_id
    fill_in "Main patient", with: @l_contact_list_contact_patient.main_patient_id
    click_on "Create Contact patient"

    assert_text "Contact patient was successfully created"
    click_on "Back"
  end

  test "updating a Contact patient" do
    visit l_contact_list_contact_patients_url
    click_on "Edit", match: :first

    fill_in "Main patient child", with: @l_contact_list_contact_patient.main_patient_child_id
    fill_in "Main patient", with: @l_contact_list_contact_patient.main_patient_id
    click_on "Update Contact patient"

    assert_text "Contact patient was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact patient" do
    visit l_contact_list_contact_patients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact patient was successfully destroyed"
  end
end
