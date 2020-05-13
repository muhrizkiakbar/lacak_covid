require "application_system_test_case"

class Main::DinkesProvincesTest < ApplicationSystemTestCase
  setup do
    @main_dinkes_province = main_dinkes_provinces(:one)
  end

  test "visiting the index" do
    visit main_dinkes_provinces_url
    assert_selector "h1", text: "Main/Dinkes Provinces"
  end

  test "creating a Dinkes province" do
    visit main_dinkes_provinces_url
    click_on "New Main/Dinkes Province"

    fill_in "Dinkes province", with: @main_dinkes_province.dinkes_province
    click_on "Create Dinkes province"

    assert_text "Dinkes province was successfully created"
    click_on "Back"
  end

  test "updating a Dinkes province" do
    visit main_dinkes_provinces_url
    click_on "Edit", match: :first

    fill_in "Dinkes province", with: @main_dinkes_province.dinkes_province
    click_on "Update Dinkes province"

    assert_text "Dinkes province was successfully updated"
    click_on "Back"
  end

  test "destroying a Dinkes province" do
    visit main_dinkes_provinces_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dinkes province was successfully destroyed"
  end
end
