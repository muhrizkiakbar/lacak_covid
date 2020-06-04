require "application_system_test_case"

class Main::PhcOfSdsTest < ApplicationSystemTestCase
  setup do
    @main_phc_of_sd = main_phc_of_sds(:one)
  end

  test "visiting the index" do
    visit main_phc_of_sds_url
    assert_selector "h1", text: "Main/Phc Of Sds"
  end

  test "creating a Phc of sd" do
    visit main_phc_of_sds_url
    click_on "New Main/Phc Of Sd"

    fill_in "Main public health center", with: @main_phc_of_sd.main_public_health_center_id
    fill_in "Main sub district", with: @main_phc_of_sd.main_sub_district_id
    click_on "Create Phc of sd"

    assert_text "Phc of sd was successfully created"
    click_on "Back"
  end

  test "updating a Phc of sd" do
    visit main_phc_of_sds_url
    click_on "Edit", match: :first

    fill_in "Main public health center", with: @main_phc_of_sd.main_public_health_center_id
    fill_in "Main sub district", with: @main_phc_of_sd.main_sub_district_id
    click_on "Update Phc of sd"

    assert_text "Phc of sd was successfully updated"
    click_on "Back"
  end

  test "destroying a Phc of sd" do
    visit main_phc_of_sds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Phc of sd was successfully destroyed"
  end
end
