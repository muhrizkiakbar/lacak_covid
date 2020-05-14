require 'test_helper'

class LampiranEleven::ContactSymptomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_contact_symptom = lampiran_eleven_contact_symptoms(:one)
  end

  test "should get index" do
    get lampiran_eleven_contact_symptoms_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_contact_symptom_url
    assert_response :success
  end

  test "should create lampiran_eleven_contact_symptom" do
    assert_difference('LampiranEleven::ContactSymptom.count') do
      post lampiran_eleven_contact_symptoms_url, params: { lampiran_eleven_contact_symptom: { date_of_cough: @lampiran_eleven_contact_symptom.date_of_cough, date_of_flu: @lampiran_eleven_contact_symptom.date_of_flu, date_of_out_of_breath: @lampiran_eleven_contact_symptom.date_of_out_of_breath, date_of_sore_throat: @lampiran_eleven_contact_symptom.date_of_sore_throat, is_cough: @lampiran_eleven_contact_symptom.is_cough, is_flu: @lampiran_eleven_contact_symptom.is_flu, is_out_of_breath: @lampiran_eleven_contact_symptom.is_out_of_breath, is_sore_throat: @lampiran_eleven_contact_symptom.is_sore_throat, lampiran_eleven_info_exposes_officer_id: @lampiran_eleven_contact_symptom.lampiran_eleven_info_exposes_officer_id } }
    end

    assert_redirected_to lampiran_eleven_contact_symptom_url(LampiranEleven::ContactSymptom.last)
  end

  test "should show lampiran_eleven_contact_symptom" do
    get lampiran_eleven_contact_symptom_url(@lampiran_eleven_contact_symptom)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_contact_symptom_url(@lampiran_eleven_contact_symptom)
    assert_response :success
  end

  test "should update lampiran_eleven_contact_symptom" do
    patch lampiran_eleven_contact_symptom_url(@lampiran_eleven_contact_symptom), params: { lampiran_eleven_contact_symptom: { date_of_cough: @lampiran_eleven_contact_symptom.date_of_cough, date_of_flu: @lampiran_eleven_contact_symptom.date_of_flu, date_of_out_of_breath: @lampiran_eleven_contact_symptom.date_of_out_of_breath, date_of_sore_throat: @lampiran_eleven_contact_symptom.date_of_sore_throat, is_cough: @lampiran_eleven_contact_symptom.is_cough, is_flu: @lampiran_eleven_contact_symptom.is_flu, is_out_of_breath: @lampiran_eleven_contact_symptom.is_out_of_breath, is_sore_throat: @lampiran_eleven_contact_symptom.is_sore_throat, lampiran_eleven_info_exposes_officer_id: @lampiran_eleven_contact_symptom.lampiran_eleven_info_exposes_officer_id } }
    assert_redirected_to lampiran_eleven_contact_symptom_url(@lampiran_eleven_contact_symptom)
  end

  test "should destroy lampiran_eleven_contact_symptom" do
    assert_difference('LampiranEleven::ContactSymptom.count', -1) do
      delete lampiran_eleven_contact_symptom_url(@lampiran_eleven_contact_symptom)
    end

    assert_redirected_to lampiran_eleven_contact_symptoms_url
  end
end
