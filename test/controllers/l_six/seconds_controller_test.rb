require 'test_helper'

class LSix::SecondsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_second = l_six_seconds(:one)
  end

  test "should get index" do
    get l_six_seconds_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_second_url
    assert_response :success
  end

  test "should create l_six_second" do
    assert_difference('LSix::Second.count') do
      post l_six_seconds_url, params: { l_six_second: { abdominal_pain: @l_six_second.abdominal_pain, ardc: @l_six_second.ardc, cold: @l_six_second.cold, cough: @l_six_second.cough, date_of_die: @l_six_second.date_of_die, diarrhea: @l_six_second.diarrhea, explain_etiologi: @l_six_second.explain_etiologi, fever_temperature: @l_six_second.fever_temperature, have_etiologi: @l_six_second.have_etiologi, headache: @l_six_second.headache, history_fever: @l_six_second.history_fever, is_being_treated_hospital: @l_six_second.is_being_treated_hospital, is_diabetes: @l_six_second.is_diabetes, is_emco: @l_six_second.is_emco, is_heart_disease: @l_six_second.is_heart_disease, is_hypertention: @l_six_second.is_hypertention, is_immune_disease: @l_six_second.is_immune_disease, is_intubation: @l_six_second.is_intubation, is_kidney_disease: @l_six_second.is_kidney_disease, is_liver_disease: @l_six_second.is_liver_disease, is_malignancy: @l_six_second.is_malignancy, is_ppok: @l_six_second.is_ppok, is_pregnant: @l_six_second.is_pregnant, is_treated_icu: @l_six_second.is_treated_icu, l_six_first_id: @l_six_second.l_six_first_id, last_date_hospital: @l_six_second.last_date_hospital, last_hospital: @l_six_second.last_hospital, last_status_patient: @l_six_second.last_status_patient, main_hospital_id: @l_six_second.main_hospital_id, muscle_ache: @l_six_second.muscle_ache, nausea_vomitting: @l_six_second.nausea_vomitting, other_condition: @l_six_second.other_condition, other_diagnose: @l_six_second.other_diagnose, other_symptom: @l_six_second.other_symptom, pneumonia: @l_six_second.pneumonia, room_treated: @l_six_second.room_treated, since_date_symptom: @l_six_second.since_date_symptom, sore_throat: @l_six_second.sore_throat, weak: @l_six_second.weak } }
    end

    assert_redirected_to l_six_second_url(LSix::Second.last)
  end

  test "should show l_six_second" do
    get l_six_second_url(@l_six_second)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_second_url(@l_six_second)
    assert_response :success
  end

  test "should update l_six_second" do
    patch l_six_second_url(@l_six_second), params: { l_six_second: { abdominal_pain: @l_six_second.abdominal_pain, ardc: @l_six_second.ardc, cold: @l_six_second.cold, cough: @l_six_second.cough, date_of_die: @l_six_second.date_of_die, diarrhea: @l_six_second.diarrhea, explain_etiologi: @l_six_second.explain_etiologi, fever_temperature: @l_six_second.fever_temperature, have_etiologi: @l_six_second.have_etiologi, headache: @l_six_second.headache, history_fever: @l_six_second.history_fever, is_being_treated_hospital: @l_six_second.is_being_treated_hospital, is_diabetes: @l_six_second.is_diabetes, is_emco: @l_six_second.is_emco, is_heart_disease: @l_six_second.is_heart_disease, is_hypertention: @l_six_second.is_hypertention, is_immune_disease: @l_six_second.is_immune_disease, is_intubation: @l_six_second.is_intubation, is_kidney_disease: @l_six_second.is_kidney_disease, is_liver_disease: @l_six_second.is_liver_disease, is_malignancy: @l_six_second.is_malignancy, is_ppok: @l_six_second.is_ppok, is_pregnant: @l_six_second.is_pregnant, is_treated_icu: @l_six_second.is_treated_icu, l_six_first_id: @l_six_second.l_six_first_id, last_date_hospital: @l_six_second.last_date_hospital, last_hospital: @l_six_second.last_hospital, last_status_patient: @l_six_second.last_status_patient, main_hospital_id: @l_six_second.main_hospital_id, muscle_ache: @l_six_second.muscle_ache, nausea_vomitting: @l_six_second.nausea_vomitting, other_condition: @l_six_second.other_condition, other_diagnose: @l_six_second.other_diagnose, other_symptom: @l_six_second.other_symptom, pneumonia: @l_six_second.pneumonia, room_treated: @l_six_second.room_treated, since_date_symptom: @l_six_second.since_date_symptom, sore_throat: @l_six_second.sore_throat, weak: @l_six_second.weak } }
    assert_redirected_to l_six_second_url(@l_six_second)
  end

  test "should destroy l_six_second" do
    assert_difference('LSix::Second.count', -1) do
      delete l_six_second_url(@l_six_second)
    end

    assert_redirected_to l_six_seconds_url
  end
end
