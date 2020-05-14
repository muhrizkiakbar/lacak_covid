require 'test_helper'

class LampiranEleven::ComorbidConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_comorbid_condition = lampiran_eleven_comorbid_conditions(:one)
  end

  test "should get index" do
    get lampiran_eleven_comorbid_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_comorbid_condition_url
    assert_response :success
  end

  test "should create lampiran_eleven_comorbid_condition" do
    assert_difference('LampiranEleven::ComorbidCondition.count') do
      post lampiran_eleven_comorbid_conditions_url, params: { lampiran_eleven_comorbid_condition: { date_of_influenza_vaccine: @lampiran_eleven_comorbid_condition.date_of_influenza_vaccine, date_of_pvc_vaccine: @lampiran_eleven_comorbid_condition.date_of_pvc_vaccine, estimated_birth: @lampiran_eleven_comorbid_condition.estimated_birth, influenza_vaccine_in_the_country: @lampiran_eleven_comorbid_condition.influenza_vaccine_in_the_country, is_asthma: @lampiran_eleven_comorbid_condition.is_asthma, is_blood_disorder: @lampiran_eleven_comorbid_condition.is_blood_disorder, is_cancer: @lampiran_eleven_comorbid_condition.is_cancer, is_diabetes: @lampiran_eleven_comorbid_condition.is_diabetes, is_first_semester_pregnant: @lampiran_eleven_comorbid_condition.is_first_semester_pregnant, is_heart_disease: @lampiran_eleven_comorbid_condition.is_heart_disease, is_hiv: @lampiran_eleven_comorbid_condition.is_hiv, is_influenza_vaccine: @lampiran_eleven_comorbid_condition.is_influenza_vaccine, is_kidney: @lampiran_eleven_comorbid_condition.is_kidney, is_liver: @lampiran_eleven_comorbid_condition.is_liver, is_neurology: @lampiran_eleven_comorbid_condition.is_neurology, is_obesity: @lampiran_eleven_comorbid_condition.is_obesity, is_organ_donor_recipient: @lampiran_eleven_comorbid_condition.is_organ_donor_recipient, is_ppok: @lampiran_eleven_comorbid_condition.is_ppok, is_pregnant: @lampiran_eleven_comorbid_condition.is_pregnant, is_pvc_vaccine: @lampiran_eleven_comorbid_condition.is_pvc_vaccine, is_second_semester_pregnant: @lampiran_eleven_comorbid_condition.is_second_semester_pregnant, is_third_semester_pregnant: @lampiran_eleven_comorbid_condition.is_third_semester_pregnant, lampiran_eleven_close_contact_information_id: @lampiran_eleven_comorbid_condition.lampiran_eleven_close_contact_information_id } }
    end

    assert_redirected_to lampiran_eleven_comorbid_condition_url(LampiranEleven::ComorbidCondition.last)
  end

  test "should show lampiran_eleven_comorbid_condition" do
    get lampiran_eleven_comorbid_condition_url(@lampiran_eleven_comorbid_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_comorbid_condition_url(@lampiran_eleven_comorbid_condition)
    assert_response :success
  end

  test "should update lampiran_eleven_comorbid_condition" do
    patch lampiran_eleven_comorbid_condition_url(@lampiran_eleven_comorbid_condition), params: { lampiran_eleven_comorbid_condition: { date_of_influenza_vaccine: @lampiran_eleven_comorbid_condition.date_of_influenza_vaccine, date_of_pvc_vaccine: @lampiran_eleven_comorbid_condition.date_of_pvc_vaccine, estimated_birth: @lampiran_eleven_comorbid_condition.estimated_birth, influenza_vaccine_in_the_country: @lampiran_eleven_comorbid_condition.influenza_vaccine_in_the_country, is_asthma: @lampiran_eleven_comorbid_condition.is_asthma, is_blood_disorder: @lampiran_eleven_comorbid_condition.is_blood_disorder, is_cancer: @lampiran_eleven_comorbid_condition.is_cancer, is_diabetes: @lampiran_eleven_comorbid_condition.is_diabetes, is_first_semester_pregnant: @lampiran_eleven_comorbid_condition.is_first_semester_pregnant, is_heart_disease: @lampiran_eleven_comorbid_condition.is_heart_disease, is_hiv: @lampiran_eleven_comorbid_condition.is_hiv, is_influenza_vaccine: @lampiran_eleven_comorbid_condition.is_influenza_vaccine, is_kidney: @lampiran_eleven_comorbid_condition.is_kidney, is_liver: @lampiran_eleven_comorbid_condition.is_liver, is_neurology: @lampiran_eleven_comorbid_condition.is_neurology, is_obesity: @lampiran_eleven_comorbid_condition.is_obesity, is_organ_donor_recipient: @lampiran_eleven_comorbid_condition.is_organ_donor_recipient, is_ppok: @lampiran_eleven_comorbid_condition.is_ppok, is_pregnant: @lampiran_eleven_comorbid_condition.is_pregnant, is_pvc_vaccine: @lampiran_eleven_comorbid_condition.is_pvc_vaccine, is_second_semester_pregnant: @lampiran_eleven_comorbid_condition.is_second_semester_pregnant, is_third_semester_pregnant: @lampiran_eleven_comorbid_condition.is_third_semester_pregnant, lampiran_eleven_close_contact_information_id: @lampiran_eleven_comorbid_condition.lampiran_eleven_close_contact_information_id } }
    assert_redirected_to lampiran_eleven_comorbid_condition_url(@lampiran_eleven_comorbid_condition)
  end

  test "should destroy lampiran_eleven_comorbid_condition" do
    assert_difference('LampiranEleven::ComorbidCondition.count', -1) do
      delete lampiran_eleven_comorbid_condition_url(@lampiran_eleven_comorbid_condition)
    end

    assert_redirected_to lampiran_eleven_comorbid_conditions_url
  end
end
