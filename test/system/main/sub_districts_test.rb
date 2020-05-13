require "application_system_test_case"

class Main::SubDistrictsTest < ApplicationSystemTestCase
  setup do
    @main_sub_district = main_sub_districts(:one)
  end

  test "visiting the index" do
    visit main_sub_districts_url
    assert_selector "h1", text: "Main/Sub Districts"
  end

  test "creating a Sub district" do
    visit main_sub_districts_url
    click_on "New Main/Sub District"

    fill_in "Main district", with: @main_sub_district.main_district_id
    fill_in "Sub district", with: @main_sub_district.sub_district
    click_on "Create Sub district"

    assert_text "Sub district was successfully created"
    click_on "Back"
  end

  test "updating a Sub district" do
    visit main_sub_districts_url
    click_on "Edit", match: :first

    fill_in "Main district", with: @main_sub_district.main_district_id
    fill_in "Sub district", with: @main_sub_district.sub_district
    click_on "Update Sub district"

    assert_text "Sub district was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub district" do
    visit main_sub_districts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub district was successfully destroyed"
  end
end
