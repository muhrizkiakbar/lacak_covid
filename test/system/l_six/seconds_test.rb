require "application_system_test_case"

class LSix::SecondsTest < ApplicationSystemTestCase
  setup do
    @l_six_second = l_six_seconds(:one)
  end

  test "visiting the index" do
    visit l_six_seconds_url
    assert_selector "h1", text: "L Six/Seconds"
  end

  test "creating a Second" do
    visit l_six_seconds_url
    click_on "New L Six/Second"

    fill_in "Abdominal pain", with: @l_six_second.abdominal_pain
    fill_in "Ardc", with: @l_six_second.ardc
    fill_in "Cold", with: @l_six_second.cold
    fill_in "Cough", with: @l_six_second.cough
    fill_in "Date of die", with: @l_six_second.date_of_die
    fill_in "Diarrhea", with: @l_six_second.diarrhea
    fill_in "Explain etiologi", with: @l_six_second.explain_etiologi
    fill_in "Fever temperature", with: @l_six_second.fever_temperature
    fill_in "Have etiologi", with: @l_six_second.have_etiologi
    fill_in "Headache", with: @l_six_second.headache
    check "History fever" if @l_six_second.history_fever
    check "Is being treated hospital" if @l_six_second.is_being_treated_hospital
    check "Is diabetes" if @l_six_second.is_diabetes
    check "Is emco" if @l_six_second.is_emco
    check "Is heart disease" if @l_six_second.is_heart_disease
    check "Is hypertention" if @l_six_second.is_hypertention
    check "Is immune disease" if @l_six_second.is_immune_disease
    check "Is intubation" if @l_six_second.is_intubation
    check "Is kidney disease" if @l_six_second.is_kidney_disease
    check "Is liver disease" if @l_six_second.is_liver_disease
    check "Is malignancy" if @l_six_second.is_malignancy
    check "Is ppok" if @l_six_second.is_ppok
    check "Is pregnant" if @l_six_second.is_pregnant
    check "Is treated icu" if @l_six_second.is_treated_icu
    fill_in "L six first", with: @l_six_second.l_six_first_id
    fill_in "Last date hospital", with: @l_six_second.last_date_hospital
    fill_in "Last hospital", with: @l_six_second.last_hospital
    fill_in "Last status patient", with: @l_six_second.last_status_patient
    fill_in "Main hospital", with: @l_six_second.main_hospital_id
    fill_in "Muscle ache", with: @l_six_second.muscle_ache
    fill_in "Nausea vomitting", with: @l_six_second.nausea_vomitting
    fill_in "Other condition", with: @l_six_second.other_condition
    fill_in "Other diagnose", with: @l_six_second.other_diagnose
    fill_in "Other symptom", with: @l_six_second.other_symptom
    fill_in "Pneumonia", with: @l_six_second.pneumonia
    fill_in "Room treated", with: @l_six_second.room_treated
    fill_in "Since date symptom", with: @l_six_second.since_date_symptom
    fill_in "Sore throat", with: @l_six_second.sore_throat
    fill_in "Weak", with: @l_six_second.weak
    click_on "Create Second"

    assert_text "Second was successfully created"
    click_on "Back"
  end

  test "updating a Second" do
    visit l_six_seconds_url
    click_on "Edit", match: :first

    fill_in "Abdominal pain", with: @l_six_second.abdominal_pain
    fill_in "Ardc", with: @l_six_second.ardc
    fill_in "Cold", with: @l_six_second.cold
    fill_in "Cough", with: @l_six_second.cough
    fill_in "Date of die", with: @l_six_second.date_of_die
    fill_in "Diarrhea", with: @l_six_second.diarrhea
    fill_in "Explain etiologi", with: @l_six_second.explain_etiologi
    fill_in "Fever temperature", with: @l_six_second.fever_temperature
    fill_in "Have etiologi", with: @l_six_second.have_etiologi
    fill_in "Headache", with: @l_six_second.headache
    check "History fever" if @l_six_second.history_fever
    check "Is being treated hospital" if @l_six_second.is_being_treated_hospital
    check "Is diabetes" if @l_six_second.is_diabetes
    check "Is emco" if @l_six_second.is_emco
    check "Is heart disease" if @l_six_second.is_heart_disease
    check "Is hypertention" if @l_six_second.is_hypertention
    check "Is immune disease" if @l_six_second.is_immune_disease
    check "Is intubation" if @l_six_second.is_intubation
    check "Is kidney disease" if @l_six_second.is_kidney_disease
    check "Is liver disease" if @l_six_second.is_liver_disease
    check "Is malignancy" if @l_six_second.is_malignancy
    check "Is ppok" if @l_six_second.is_ppok
    check "Is pregnant" if @l_six_second.is_pregnant
    check "Is treated icu" if @l_six_second.is_treated_icu
    fill_in "L six first", with: @l_six_second.l_six_first_id
    fill_in "Last date hospital", with: @l_six_second.last_date_hospital
    fill_in "Last hospital", with: @l_six_second.last_hospital
    fill_in "Last status patient", with: @l_six_second.last_status_patient
    fill_in "Main hospital", with: @l_six_second.main_hospital_id
    fill_in "Muscle ache", with: @l_six_second.muscle_ache
    fill_in "Nausea vomitting", with: @l_six_second.nausea_vomitting
    fill_in "Other condition", with: @l_six_second.other_condition
    fill_in "Other diagnose", with: @l_six_second.other_diagnose
    fill_in "Other symptom", with: @l_six_second.other_symptom
    fill_in "Pneumonia", with: @l_six_second.pneumonia
    fill_in "Room treated", with: @l_six_second.room_treated
    fill_in "Since date symptom", with: @l_six_second.since_date_symptom
    fill_in "Sore throat", with: @l_six_second.sore_throat
    fill_in "Weak", with: @l_six_second.weak
    click_on "Update Second"

    assert_text "Second was successfully updated"
    click_on "Back"
  end

  test "destroying a Second" do
    visit l_six_seconds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Second was successfully destroyed"
  end
end
