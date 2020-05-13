require "application_system_test_case"

class Main::CitiesTest < ApplicationSystemTestCase
  setup do
    @main_city = main_cities(:one)
  end

  test "visiting the index" do
    visit main_cities_url
    assert_selector "h1", text: "Main/Cities"
  end

  test "creating a City" do
    visit main_cities_url
    click_on "New Main/City"

    fill_in "City", with: @main_city.city
    fill_in "Main province", with: @main_city.main_province_id
    click_on "Create City"

    assert_text "City was successfully created"
    click_on "Back"
  end

  test "updating a City" do
    visit main_cities_url
    click_on "Edit", match: :first

    fill_in "City", with: @main_city.city
    fill_in "Main province", with: @main_city.main_province_id
    click_on "Update City"

    assert_text "City was successfully updated"
    click_on "Back"
  end

  test "destroying a City" do
    visit main_cities_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "City was successfully destroyed"
  end
end
