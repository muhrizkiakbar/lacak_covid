require "application_system_test_case"

class Main::PatientsTest < ApplicationSystemTestCase
  setup do
    @main_patient = main_patients(:one)
  end

  test "visiting the index" do
    visit main_patients_url
    assert_selector "h1", text: "Main/Patients"
  end

  test "creating a Patient" do
    visit main_patients_url
    click_on "New Main/Patient"

    fill_in "Address", with: @main_patient.address
    fill_in "Date of birth", with: @main_patient.date_of_birth
    fill_in "Gender", with: @main_patient.gender
    fill_in "Main citizen association", with: @main_patient.main_citizen_association_id
    fill_in "Main city", with: @main_patient.main_city_id
    fill_in "Main district", with: @main_patient.main_district_id
    fill_in "Main marital status", with: @main_patient.main_marital_status_id
    fill_in "Main neighborhood association", with: @main_patient.main_neighborhood_association_id
    fill_in "Main sub district", with: @main_patient.main_sub_district_id
    fill_in "Name", with: @main_patient.name
    fill_in "Name of parent", with: @main_patient.name_of_parent
    fill_in "No identity", with: @main_patient.no_identity
    fill_in "Phone number", with: @main_patient.phone_number
    click_on "Create Patient"

    assert_text "Patient was successfully created"
    click_on "Back"
  end

  test "updating a Patient" do
    visit main_patients_url
    click_on "Edit", match: :first

    fill_in "Address", with: @main_patient.address
    fill_in "Date of birth", with: @main_patient.date_of_birth
    fill_in "Gender", with: @main_patient.gender
    fill_in "Main citizen association", with: @main_patient.main_citizen_association_id
    fill_in "Main city", with: @main_patient.main_city_id
    fill_in "Main district", with: @main_patient.main_district_id
    fill_in "Main marital status", with: @main_patient.main_marital_status_id
    fill_in "Main neighborhood association", with: @main_patient.main_neighborhood_association_id
    fill_in "Main sub district", with: @main_patient.main_sub_district_id
    fill_in "Main tribe", with: @main_patient.main_tribe_id
    fill_in "Name", with: @main_patient.name
    fill_in "Name of parent", with: @main_patient.name_of_parent
    fill_in "No identity", with: @main_patient.no_identity
    fill_in "Phone number", with: @main_patient.phone_number
    click_on "Update Patient"

    assert_text "Patient was successfully updated"
    click_on "Back"
  end

  test "destroying a Patient" do
    visit main_patients_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patient was successfully destroyed"
  end
end
