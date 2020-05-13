require "application_system_test_case"

class Main::DinkesRegionsTest < ApplicationSystemTestCase
  setup do
    @main_dinkes_region = main_dinkes_regions(:one)
  end

  test "visiting the index" do
    visit main_dinkes_regions_url
    assert_selector "h1", text: "Main/Dinkes Regions"
  end

  test "creating a Dinkes region" do
    visit main_dinkes_regions_url
    click_on "New Main/Dinkes Region"

    fill_in "Dinkes region", with: @main_dinkes_region.dinkes_region
    fill_in "Main dinkes province", with: @main_dinkes_region.main_dinkes_province_id
    click_on "Create Dinkes region"

    assert_text "Dinkes region was successfully created"
    click_on "Back"
  end

  test "updating a Dinkes region" do
    visit main_dinkes_regions_url
    click_on "Edit", match: :first

    fill_in "Dinkes region", with: @main_dinkes_region.dinkes_region
    fill_in "Main dinkes province", with: @main_dinkes_region.main_dinkes_province_id
    click_on "Update Dinkes region"

    assert_text "Dinkes region was successfully updated"
    click_on "Back"
  end

  test "destroying a Dinkes region" do
    visit main_dinkes_regions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dinkes region was successfully destroyed"
  end
end