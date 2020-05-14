require "application_system_test_case"

class LampiranEleven::InfoExposesOfficersTest < ApplicationSystemTestCase
  setup do
    @lampiran_eleven_info_exposes_officer = lampiran_eleven_info_exposes_officers(:one)
  end

  test "visiting the index" do
    visit lampiran_eleven_info_exposes_officers_url
    assert_selector "h1", text: "Lampiran Eleven/Info Exposes Officers"
  end

  test "creating a Info exposes officer" do
    visit lampiran_eleven_info_exposes_officers_url
    click_on "New Lampiran Eleven/Info Exposes Officer"

    fill_in "Explain of procedure aerosol", with: @lampiran_eleven_info_exposes_officer.explain_of_procedure_aerosol
    check "Is contact physic with positive" if @lampiran_eleven_info_exposes_officer.is_contact_physic_with_positive
    check "Is procedure aerosol" if @lampiran_eleven_info_exposes_officer.is_procedure_aerosol
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_info_exposes_officer.lampiran_eleven_close_contact_information_id
    fill_in "Main dinkes province", with: @lampiran_eleven_info_exposes_officer.main_dinkes_province_id
    fill_in "Main dinkes region", with: @lampiran_eleven_info_exposes_officer.main_dinkes_region_id
    fill_in "Main hospital", with: @lampiran_eleven_info_exposes_officer.main_hospital_id
    fill_in "Main public health center", with: @lampiran_eleven_info_exposes_officer.main_public_health_center_id
    click_on "Create Info exposes officer"

    assert_text "Info exposes officer was successfully created"
    click_on "Back"
  end

  test "updating a Info exposes officer" do
    visit lampiran_eleven_info_exposes_officers_url
    click_on "Edit", match: :first

    fill_in "Explain of procedure aerosol", with: @lampiran_eleven_info_exposes_officer.explain_of_procedure_aerosol
    check "Is contact physic with positive" if @lampiran_eleven_info_exposes_officer.is_contact_physic_with_positive
    check "Is procedure aerosol" if @lampiran_eleven_info_exposes_officer.is_procedure_aerosol
    fill_in "Lampiran eleven close contact information", with: @lampiran_eleven_info_exposes_officer.lampiran_eleven_close_contact_information_id
    fill_in "Main dinkes province", with: @lampiran_eleven_info_exposes_officer.main_dinkes_province_id
    fill_in "Main dinkes region", with: @lampiran_eleven_info_exposes_officer.main_dinkes_region_id
    fill_in "Main hospital", with: @lampiran_eleven_info_exposes_officer.main_hospital_id
    fill_in "Main public health center", with: @lampiran_eleven_info_exposes_officer.main_public_health_center_id
    click_on "Update Info exposes officer"

    assert_text "Info exposes officer was successfully updated"
    click_on "Back"
  end

  test "destroying a Info exposes officer" do
    visit lampiran_eleven_info_exposes_officers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Info exposes officer was successfully destroyed"
  end
end
