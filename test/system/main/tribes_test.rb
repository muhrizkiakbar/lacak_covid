require "application_system_test_case"

class Main::TribesTest < ApplicationSystemTestCase
  setup do
    @main_tribe = main_tribes(:one)
  end

  test "visiting the index" do
    visit main_tribes_url
    assert_selector "h1", text: "Main/Tribes"
  end

  test "creating a Tribe" do
    visit main_tribes_url
    click_on "New Main/Tribe"

    fill_in "Tribe", with: @main_tribe.tribe
    click_on "Create Tribe"

    assert_text "Tribe was successfully created"
    click_on "Back"
  end

  test "updating a Tribe" do
    visit main_tribes_url
    click_on "Edit", match: :first

    fill_in "Tribe", with: @main_tribe.tribe
    click_on "Update Tribe"

    assert_text "Tribe was successfully updated"
    click_on "Back"
  end

  test "destroying a Tribe" do
    visit main_tribes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tribe was successfully destroyed"
  end
end
