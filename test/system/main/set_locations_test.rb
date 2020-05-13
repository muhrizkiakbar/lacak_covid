require "application_system_test_case"

class Main::SetLocationsTest < ApplicationSystemTestCase
  setup do
    @main_set_location = main_set_locations(:one)
  end

  test "visiting the index" do
    visit main_set_locations_url
    assert_selector "h1", text: "Main/Set Locations"
  end

  test "creating a Set location" do
    visit main_set_locations_url
    click_on "New Main/Set Location"

    fill_in "Set location", with: @main_set_location.set_location
    click_on "Create Set location"

    assert_text "Set location was successfully created"
    click_on "Back"
  end

  test "updating a Set location" do
    visit main_set_locations_url
    click_on "Edit", match: :first

    fill_in "Set location", with: @main_set_location.set_location
    click_on "Update Set location"

    assert_text "Set location was successfully updated"
    click_on "Back"
  end

  test "destroying a Set location" do
    visit main_set_locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Set location was successfully destroyed"
  end
end
