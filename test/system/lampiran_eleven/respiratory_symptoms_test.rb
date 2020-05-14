require "application_system_test_case"

class LampiranEleven::RespiratorySymptomsTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_respiratory_symptom = lampiran_eleven_respiratory_symptoms(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_respiratory_symptoms_url
    assert_selector "h1", text: "Lampiran Eleven/Respiratory Symptoms"
  end

  test "creating a Respiratory symptom" do
    visit lampiran_eleven_respiratory_symptoms_url
    click_on "New Lampiran Eleven/Respiratory Symptom"

    fill_in "Date of cough", with: @lampiran_eleven_respiratory_symptom.date_of_cough
    fill_in "Date of flu", with: @lampiran_eleven_respiratory_symptom.date_of_flu
    fill_in "Date of out of breath", with: @lampiran_eleven_respiratory_symptom.date_of_out_of_breath
    fill_in "Date of sore throat", with: @lampiran_eleven_respiratory_symptom.date_of_sore_throat
    check "Is cough" if @lampiran_eleven_respiratory_symptom.is_cough
    check "Is flu" if @lampiran_eleven_respiratory_symptom.is_flu
    check "Is out of breath" if @lampiran_eleven_respiratory_symptom.is_out_of_breath
    check "Is sore throat" if @lampiran_eleven_respiratory_symptom.is_sore_throat
    fill_in "Lampiran eleven info exposes officer", with: @lampiran_eleven_respiratory_symptom.lampiran_eleven_info_exposes_officer_id
    click_on "Create Respiratory symptom"

    assert_text "Respiratory symptom was successfully created"
    click_on "Back"
  end

  test "updating a Respiratory symptom" do
    visit lampiran_eleven_respiratory_symptoms_url
    click_on "Edit", match: :first

    fill_in "Date of cough", with: @lampiran_eleven_respiratory_symptom.date_of_cough
    fill_in "Date of flu", with: @lampiran_eleven_respiratory_symptom.date_of_flu
    fill_in "Date of out of breath", with: @lampiran_eleven_respiratory_symptom.date_of_out_of_breath
    fill_in "Date of sore throat", with: @lampiran_eleven_respiratory_symptom.date_of_sore_throat
    check "Is cough" if @lampiran_eleven_respiratory_symptom.is_cough
    check "Is flu" if @lampiran_eleven_respiratory_symptom.is_flu
    check "Is out of breath" if @lampiran_eleven_respiratory_symptom.is_out_of_breath
    check "Is sore throat" if @lampiran_eleven_respiratory_symptom.is_sore_throat
    fill_in "Lampiran eleven info exposes officer", with: @lampiran_eleven_respiratory_symptom.lampiran_eleven_info_exposes_officer_id
    click_on "Update Respiratory symptom"

    assert_text "Respiratory symptom was successfully updated"
    click_on "Back"
  end

  test "destroying a Respiratory symptom" do
    visit lampiran_eleven_respiratory_symptoms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Respiratory symptom was successfully destroyed"
  end
end
