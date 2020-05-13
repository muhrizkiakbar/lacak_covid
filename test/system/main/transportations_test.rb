require "application_system_test_case"

class Main::TransportationsTest < ApplicationSystemTestCase
  setup do
    @main_transportation = main_transportations(:one)
  end

  test "visiting the index" do
    visit main_transportations_url
    assert_selector "h1", text: "Main/Transportations"
  end

  test "creating a Transportation" do
    visit main_transportations_url
    click_on "New Main/Transportation"

    fill_in "Transportation", with: @main_transportation.transportation
    click_on "Create Transportation"

    assert_text "Transportation was successfully created"
    click_on "Back"
  end

  test "updating a Transportation" do
    visit main_transportations_url
    click_on "Edit", match: :first

    fill_in "Transportation", with: @main_transportation.transportation
    click_on "Update Transportation"

    assert_text "Transportation was successfully updated"
    click_on "Back"
  end

  test "destroying a Transportation" do
    visit main_transportations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transportation was successfully destroyed"
  end
end
