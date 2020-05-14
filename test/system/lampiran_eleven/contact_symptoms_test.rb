require "application_system_test_case"

class LampiranEleven::ContactSymptomsTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_contact_symptom = lampiran_eleven_contact_symptoms(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_contact_symptoms_url
    assert_selector "h1", text: "Lampiran Eleven/Contact Symptoms"
  end

  test "creating a Contact symptom" do
    visit lampiran_eleven_contact_symptoms_url
    click_on "New Lampiran Eleven/Contact Symptom"

    fill_in "Date of cough", with: @lampiran_eleven_contact_symptom.date_of_cough
    fill_in "Date of flu", with: @lampiran_eleven_contact_symptom.date_of_flu
    fill_in "Date of out of breath", with: @lampiran_eleven_contact_symptom.date_of_out_of_breath
    fill_in "Date of sore throat", with: @lampiran_eleven_contact_symptom.date_of_sore_throat
    check "Is cough" if @lampiran_eleven_contact_symptom.is_cough
    check "Is flu" if @lampiran_eleven_contact_symptom.is_flu
    check "Is out of breath" if @lampiran_eleven_contact_symptom.is_out_of_breath
    check "Is sore throat" if @lampiran_eleven_contact_symptom.is_sore_throat
    fill_in "Lampiran eleven info exposes officer", with: @lampiran_eleven_contact_symptom.lampiran_eleven_info_exposes_officer_id
    click_on "Create Contact symptom"

    assert_text "Contact symptom was successfully created"
    click_on "Back"
  end

  test "updating a Contact symptom" do
    visit lampiran_eleven_contact_symptoms_url
    click_on "Edit", match: :first

    fill_in "Date of cough", with: @lampiran_eleven_contact_symptom.date_of_cough
    fill_in "Date of flu", with: @lampiran_eleven_contact_symptom.date_of_flu
    fill_in "Date of out of breath", with: @lampiran_eleven_contact_symptom.date_of_out_of_breath
    fill_in "Date of sore throat", with: @lampiran_eleven_contact_symptom.date_of_sore_throat
    check "Is cough" if @lampiran_eleven_contact_symptom.is_cough
    check "Is flu" if @lampiran_eleven_contact_symptom.is_flu
    check "Is out of breath" if @lampiran_eleven_contact_symptom.is_out_of_breath
    check "Is sore throat" if @lampiran_eleven_contact_symptom.is_sore_throat
    fill_in "Lampiran eleven info exposes officer", with: @lampiran_eleven_contact_symptom.lampiran_eleven_info_exposes_officer_id
    click_on "Update Contact symptom"

    assert_text "Contact symptom was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact symptom" do
    visit lampiran_eleven_contact_symptoms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact symptom was successfully destroyed"
  end
end
