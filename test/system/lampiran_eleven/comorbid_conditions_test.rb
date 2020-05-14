require "application_system_test_case"

class LampiranEleven::ComorbidConditionsTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_comorbid_condition = lampiran_eleven_comorbid_conditions(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_comorbid_conditions_url
    assert_selector "h1", text: "Lampiran Eleven/Comorbid Conditions"
  end

  test "creating a Comorbid condition" do
    visit lampiran_eleven_comorbid_conditions_url
    click_on "New Lampiran Eleven/Comorbid Condition"

    fill_in "Date of influenza vaccine", with: @lampiran_eleven_comorbid_condition.date_of_influenza_vaccine
    fill_in "Date of pvc vaccine", with: @lampiran_eleven_comorbid_condition.date_of_pvc_vaccine
    fill_in "Estimated birth", with: @lampiran_eleven_comorbid_condition.estimated_birth
    fill_in "Influenza vaccine in the country", with: @lampiran_eleven_comorbid_condition.influenza_vaccine_in_the_country
    check "Is asthma" if @lampiran_eleven_comorbid_condition.is_asthma
    check "Is blood disorder" if @lampiran_eleven_comorbid_condition.is_blood_disorder
    check "Is cancer" if @lampiran_eleven_comorbid_condition.is_cancer
    check "Is diabetes" if @lampiran_eleven_comorbid_condition.is_diabetes
    check "Is first semester pregnant" if @lampiran_eleven_comorbid_condition.is_first_semester_pregnant
    check "Is heart disease" if @lampiran_eleven_comorbid_condition.is_heart_disease
    check "Is hiv" if @lampiran_eleven_comorbid_condition.is_hiv
    check "Is influenza vaccine" if @lampiran_eleven_comorbid_condition.is_influenza_vaccine
    check "Is kidney" if @lampiran_eleven_comorbid_condition.is_kidney
    check "Is liver" if @lampiran_eleven_comorbid_condition.is_liver
    check "Is neurology" if @lampiran_eleven_comorbid_condition.is_neurology
    check "Is obesity" if @lampiran_eleven_comorbid_condition.is_obesity
    check "Is organ donor recipient" if @lampiran_eleven_comorbid_condition.is_organ_donor_recipient
    check "Is ppok" if @lampiran_eleven_comorbid_condition.is_ppok
    check "Is pregnant" if @lampiran_eleven_comorbid_condition.is_pregnant
    check "Is pvc vaccine" if @lampiran_eleven_comorbid_condition.is_pvc_vaccine
    check "Is second semester pregnant" if @lampiran_eleven_comorbid_condition.is_second_semester_pregnant
    check "Is third semester pregnant" if @lampiran_eleven_comorbid_condition.is_third_semester_pregnant
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_comorbid_condition.lampiran_eleven_close_contact_information_id
    click_on "Create Comorbid condition"

    assert_text "Comorbid condition was successfully created"
    click_on "Back"
  end

  test "updating a Comorbid condition" do
    visit lampiran_eleven_comorbid_conditions_url
    click_on "Edit", match: :first

    fill_in "Date of influenza vaccine", with: @lampiran_eleven_comorbid_condition.date_of_influenza_vaccine
    fill_in "Date of pvc vaccine", with: @lampiran_eleven_comorbid_condition.date_of_pvc_vaccine
    fill_in "Estimated birth", with: @lampiran_eleven_comorbid_condition.estimated_birth
    fill_in "Influenza vaccine in the country", with: @lampiran_eleven_comorbid_condition.influenza_vaccine_in_the_country
    check "Is asthma" if @lampiran_eleven_comorbid_condition.is_asthma
    check "Is blood disorder" if @lampiran_eleven_comorbid_condition.is_blood_disorder
    check "Is cancer" if @lampiran_eleven_comorbid_condition.is_cancer
    check "Is diabetes" if @lampiran_eleven_comorbid_condition.is_diabetes
    check "Is first semester pregnant" if @lampiran_eleven_comorbid_condition.is_first_semester_pregnant
    check "Is heart disease" if @lampiran_eleven_comorbid_condition.is_heart_disease
    check "Is hiv" if @lampiran_eleven_comorbid_condition.is_hiv
    check "Is influenza vaccine" if @lampiran_eleven_comorbid_condition.is_influenza_vaccine
    check "Is kidney" if @lampiran_eleven_comorbid_condition.is_kidney
    check "Is liver" if @lampiran_eleven_comorbid_condition.is_liver
    check "Is neurology" if @lampiran_eleven_comorbid_condition.is_neurology
    check "Is obesity" if @lampiran_eleven_comorbid_condition.is_obesity
    check "Is organ donor recipient" if @lampiran_eleven_comorbid_condition.is_organ_donor_recipient
    check "Is ppok" if @lampiran_eleven_comorbid_condition.is_ppok
    check "Is pregnant" if @lampiran_eleven_comorbid_condition.is_pregnant
    check "Is pvc vaccine" if @lampiran_eleven_comorbid_condition.is_pvc_vaccine
    check "Is second semester pregnant" if @lampiran_eleven_comorbid_condition.is_second_semester_pregnant
    check "Is third semester pregnant" if @lampiran_eleven_comorbid_condition.is_third_semester_pregnant
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_comorbid_condition.lampiran_eleven_close_contact_information_id
    click_on "Update Comorbid condition"

    assert_text "Comorbid condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Comorbid condition" do
    visit lampiran_eleven_comorbid_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comorbid condition was successfully destroyed"
  end
end
