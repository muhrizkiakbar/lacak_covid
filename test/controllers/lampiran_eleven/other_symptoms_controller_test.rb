require 'test_helper'

class LampiranEleven::OtherSymptomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_other_symptom = lampiran_eleven_other_symptoms(:one)
  end

  test "should get index" do
    get lampiran_eleven_other_symptoms_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_other_symptom_url
    assert_response :success
  end

  test "should create lampiran_eleven_other_symptom" do
    assert_difference('LampiranEleven::OtherSymptom.count') do
      post lampiran_eleven_other_symptoms_url, params: { lampiran_eleven_other_symptom: { is_bloody_nose: @lampiran_eleven_other_symptom.is_bloody_nose, is_conjuctivitis: @lampiran_eleven_other_symptom.is_conjuctivitis, is_convulsions: @lampiran_eleven_other_symptom.is_convulsions, is_diarrhea: @lampiran_eleven_other_symptom.is_diarrhea, is_fatigue: @lampiran_eleven_other_symptom.is_fatigue, is_headache: @lampiran_eleven_other_symptom.is_headache, is_joint_pain: @lampiran_eleven_other_symptom.is_joint_pain, is_loss_of_appetite: @lampiran_eleven_other_symptom.is_loss_of_appetite, is_loss_of_consciousness: @lampiran_eleven_other_symptom.is_loss_of_consciousness, is_muscleache: @lampiran_eleven_other_symptom.is_muscleache, is_nausea: @lampiran_eleven_other_symptom.is_nausea, is_neurologis: @lampiran_eleven_other_symptom.is_neurologis, is_rash: @lampiran_eleven_other_symptom.is_rash, is_shivering: @lampiran_eleven_other_symptom.is_shivering, is_throw_up: @lampiran_eleven_other_symptom.is_throw_up, lampiran_eleven_info_exposes_officer_id: @lampiran_eleven_other_symptom.lampiran_eleven_info_exposes_officer_id, other_symptom: @lampiran_eleven_other_symptom.other_symptom, tell_of_neurologis: @lampiran_eleven_other_symptom.tell_of_neurologis } }
    end

    assert_redirected_to lampiran_eleven_other_symptom_url(LampiranEleven::OtherSymptom.last)
  end

  test "should show lampiran_eleven_other_symptom" do
    get lampiran_eleven_other_symptom_url(@lampiran_eleven_other_symptom)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_other_symptom_url(@lampiran_eleven_other_symptom)
    assert_response :success
  end

  test "should update lampiran_eleven_other_symptom" do
    patch lampiran_eleven_other_symptom_url(@lampiran_eleven_other_symptom), params: { lampiran_eleven_other_symptom: { is_bloody_nose: @lampiran_eleven_other_symptom.is_bloody_nose, is_conjuctivitis: @lampiran_eleven_other_symptom.is_conjuctivitis, is_convulsions: @lampiran_eleven_other_symptom.is_convulsions, is_diarrhea: @lampiran_eleven_other_symptom.is_diarrhea, is_fatigue: @lampiran_eleven_other_symptom.is_fatigue, is_headache: @lampiran_eleven_other_symptom.is_headache, is_joint_pain: @lampiran_eleven_other_symptom.is_joint_pain, is_loss_of_appetite: @lampiran_eleven_other_symptom.is_loss_of_appetite, is_loss_of_consciousness: @lampiran_eleven_other_symptom.is_loss_of_consciousness, is_muscleache: @lampiran_eleven_other_symptom.is_muscleache, is_nausea: @lampiran_eleven_other_symptom.is_nausea, is_neurologis: @lampiran_eleven_other_symptom.is_neurologis, is_rash: @lampiran_eleven_other_symptom.is_rash, is_shivering: @lampiran_eleven_other_symptom.is_shivering, is_throw_up: @lampiran_eleven_other_symptom.is_throw_up, lampiran_eleven_info_exposes_officer_id: @lampiran_eleven_other_symptom.lampiran_eleven_info_exposes_officer_id, other_symptom: @lampiran_eleven_other_symptom.other_symptom, tell_of_neurologis: @lampiran_eleven_other_symptom.tell_of_neurologis } }
    assert_redirected_to lampiran_eleven_other_symptom_url(@lampiran_eleven_other_symptom)
  end

  test "should destroy lampiran_eleven_other_symptom" do
    assert_difference('LampiranEleven::OtherSymptom.count', -1) do
      delete lampiran_eleven_other_symptom_url(@lampiran_eleven_other_symptom)
    end

    assert_redirected_to lampiran_eleven_other_symptoms_url
  end
end
