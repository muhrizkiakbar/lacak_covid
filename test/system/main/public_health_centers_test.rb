require "application_system_test_case"

class Main::PublicHealthCentersTest < ApplicationSystemTestCase
  setup do
    @main_public_health_center = main_public_health_centers(:one)
  end

  test "visiting the index" do
    visit main_public_health_centers_url
    assert_selector "h1", text: "Main/Public Health Centers"
  end

  test "creating a Public health center" do
    visit main_public_health_centers_url
    click_on "New Main/Public Health Center"

    fill_in "Main hospital", with: @main_public_health_center.main_hospital_id
    fill_in "Public health center", with: @main_public_health_center.public_health_center
    click_on "Create Public health center"

    assert_text "Public health center was successfully created"
    click_on "Back"
  end

  test "updating a Public health center" do
    visit main_public_health_centers_url
    click_on "Edit", match: :first

    fill_in "Main hospital", with: @main_public_health_center.main_hospital_id
    fill_in "Public health center", with: @main_public_health_center.public_health_center
    click_on "Update Public health center"

    assert_text "Public health center was successfully updated"
    click_on "Back"
  end

  test "destroying a Public health center" do
    visit main_public_health_centers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Public health center was successfully destroyed"
  end
end
