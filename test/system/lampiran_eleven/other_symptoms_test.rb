require "application_system_test_case"

class LampiranEleven::OtherSymptomsTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_other_symptom = lampiran_eleven_other_symptoms(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_other_symptoms_url
    assert_selector "h1", text: "Lampiran Eleven/Other Symptoms"
  end

  test "creating a Other symptom" do
    visit lampiran_eleven_other_symptoms_url
    click_on "New Lampiran Eleven/Other Symptom"

    check "Is bloody nose" if @lampiran_eleven_other_symptom.is_bloody_nose
    check "Is conjuctivitis" if @lampiran_eleven_other_symptom.is_conjuctivitis
    check "Is convulsions" if @lampiran_eleven_other_symptom.is_convulsions
    check "Is diarrhea" if @lampiran_eleven_other_symptom.is_diarrhea
    check "Is fatigue" if @lampiran_eleven_other_symptom.is_fatigue
    check "Is headache" if @lampiran_eleven_other_symptom.is_headache
    check "Is joint pain" if @lampiran_eleven_other_symptom.is_joint_pain
    check "Is loss of appetite" if @lampiran_eleven_other_symptom.is_loss_of_appetite
    check "Is loss of consciousness" if @lampiran_eleven_other_symptom.is_loss_of_consciousness
    check "Is muscleache" if @lampiran_eleven_other_symptom.is_muscleache
    check "Is nausea" if @lampiran_eleven_other_symptom.is_nausea
    check "Is neurologis" if @lampiran_eleven_other_symptom.is_neurologis
    check "Is rash" if @lampiran_eleven_other_symptom.is_rash
    check "Is shivering" if @lampiran_eleven_other_symptom.is_shivering
    check "Is throw up" if @lampiran_eleven_other_symptom.is_throw_up
    fill_in "Lampiran eleven info exposes officer", with: @lampiran_eleven_other_symptom.lampiran_eleven_info_exposes_officer_id
    fill_in "Other symptom", with: @lampiran_eleven_other_symptom.other_symptom
    fill_in "Tell of neurologis", with: @lampiran_eleven_other_symptom.tell_of_neurologis
    click_on "Create Other symptom"

    assert_text "Other symptom was successfully created"
    click_on "Back"
  end

  test "updating a Other symptom" do
    visit lampiran_eleven_other_symptoms_url
    click_on "Edit", match: :first

    check "Is bloody nose" if @lampiran_eleven_other_symptom.is_bloody_nose
    check "Is conjuctivitis" if @lampiran_eleven_other_symptom.is_conjuctivitis
    check "Is convulsions" if @lampiran_eleven_other_symptom.is_convulsions
    check "Is diarrhea" if @lampiran_eleven_other_symptom.is_diarrhea
    check "Is fatigue" if @lampiran_eleven_other_symptom.is_fatigue
    check "Is headache" if @lampiran_eleven_other_symptom.is_headache
    check "Is joint pain" if @lampiran_eleven_other_symptom.is_joint_pain
    check "Is loss of appetite" if @lampiran_eleven_other_symptom.is_loss_of_appetite
    check "Is loss of consciousness" if @lampiran_eleven_other_symptom.is_loss_of_consciousness
    check "Is muscleache" if @lampiran_eleven_other_symptom.is_muscleache
    check "Is nausea" if @lampiran_eleven_other_symptom.is_nausea
    check "Is neurologis" if @lampiran_eleven_other_symptom.is_neurologis
    check "Is rash" if @lampiran_eleven_other_symptom.is_rash
    check "Is shivering" if @lampiran_eleven_other_symptom.is_shivering
    check "Is throw up" if @lampiran_eleven_other_symptom.is_throw_up
    fill_in "Lampiran eleven info exposes officer", with: @lampiran_eleven_other_symptom.lampiran_eleven_info_exposes_officer_id
    fill_in "Other symptom", with: @lampiran_eleven_other_symptom.other_symptom
    fill_in "Tell of neurologis", with: @lampiran_eleven_other_symptom.tell_of_neurologis
    click_on "Update Other symptom"

    assert_text "Other symptom was successfully updated"
    click_on "Back"
  end

  test "destroying a Other symptom" do
    visit lampiran_eleven_other_symptoms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Other symptom was successfully destroyed"
  end
end
