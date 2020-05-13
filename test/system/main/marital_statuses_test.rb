require "application_system_test_case"

class Main::MaritalStatusesTest < ApplicationSystemTestCase
  setup do
    @main_marital_status = main_marital_statuses(:one)
  end

  test "visiting the index" do
    visit main_marital_statuses_url
    assert_selector "h1", text: "Main/Marital Statuses"
  end

  test "creating a Marital status" do
    visit main_marital_statuses_url
    click_on "New Main/Marital Status"

    fill_in "Marital status", with: @main_marital_status.marital_status
    click_on "Create Marital status"

    assert_text "Marital status was successfully created"
    click_on "Back"
  end

  test "updating a Marital status" do
    visit main_marital_statuses_url
    click_on "Edit", match: :first

    fill_in "Marital status", with: @main_marital_status.marital_status
    click_on "Update Marital status"

    assert_text "Marital status was successfully updated"
    click_on "Back"
  end

  test "destroying a Marital status" do
    visit main_marital_statuses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Marital status was successfully destroyed"
  end
end
