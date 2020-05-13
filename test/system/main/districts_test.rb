require "application_system_test_case"

class Main::DistrictsTest < ApplicationSystemTestCase
  setup do
    @main_district = main_districts(:one)
  end

  test "visiting the index" do
    visit main_districts_url
    assert_selector "h1", text: "Main/Districts"
  end

  test "creating a District" do
    visit main_districts_url
    click_on "New Main/District"

    fill_in "District", with: @main_district.district
    fill_in "Main city", with: @main_district.main_city_id
    click_on "Create District"

    assert_text "District was successfully created"
    click_on "Back"
  end

  test "updating a District" do
    visit main_districts_url
    click_on "Edit", match: :first

    fill_in "District", with: @main_district.district
    fill_in "Main city", with: @main_district.main_city_id
    click_on "Update District"

    assert_text "District was successfully updated"
    click_on "Back"
  end

  test "destroying a District" do
    visit main_districts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "District was successfully destroyed"
  end
end
