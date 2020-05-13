require "application_system_test_case"

class Main::ProvincesTest < ApplicationSystemTestCase
  setup do
    @main_province = main_provinces(:one)
  end

  test "visiting the index" do
    visit main_provinces_url
    assert_selector "h1", text: "Main/Provinces"
  end

  test "creating a Province" do
    visit main_provinces_url
    click_on "New Main/Province"

    fill_in "Province", with: @main_province.province
    click_on "Create Province"

    assert_text "Province was successfully created"
    click_on "Back"
  end

  test "updating a Province" do
    visit main_provinces_url
    click_on "Edit", match: :first

    fill_in "Province", with: @main_province.province
    click_on "Update Province"

    assert_text "Province was successfully updated"
    click_on "Back"
  end

  test "destroying a Province" do
    visit main_provinces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Province was successfully destroyed"
  end
end
