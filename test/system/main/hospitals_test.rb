require "application_system_test_case"

class Main::HospitalsTest < ApplicationSystemTestCase
  setup do
    @main_hospital = main_hospitals(:one)
  end

  test "visiting the index" do
    visit main_hospitals_url
    assert_selector "h1", text: "Main/Hospitals"
  end

  test "creating a Hospital" do
    visit main_hospitals_url
    click_on "New Main/Hospital"

    fill_in "Hospital", with: @main_hospital.hospital
    check "Is primary" if @main_hospital.is_primary
    fill_in "Main dinkes region", with: @main_hospital.main_dinkes_region_id
    click_on "Create Hospital"

    assert_text "Hospital was successfully created"
    click_on "Back"
  end

  test "updating a Hospital" do
    visit main_hospitals_url
    click_on "Edit", match: :first

    fill_in "Hospital", with: @main_hospital.hospital
    check "Is primary" if @main_hospital.is_primary
    fill_in "Main dinkes region", with: @main_hospital.main_dinkes_region_id
    click_on "Update Hospital"

    assert_text "Hospital was successfully updated"
    click_on "Back"
  end

  test "destroying a Hospital" do
    visit main_hospitals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hospital was successfully destroyed"
  end
end
