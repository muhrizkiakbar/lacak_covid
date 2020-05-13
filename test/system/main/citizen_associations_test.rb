require "application_system_test_case"

class Main::CitizenAssociationsTest < ApplicationSystemTestCase
  setup do
    @main_citizen_association = main_citizen_associations(:one)
  end

  test "visiting the index" do
    visit main_citizen_associations_url
    assert_selector "h1", text: "Main/Citizen Associations"
  end

  test "creating a Citizen association" do
    visit main_citizen_associations_url
    click_on "New Main/Citizen Association"

    fill_in "Citizen association", with: @main_citizen_association.citizen_association
    fill_in "Main sub district", with: @main_citizen_association.main_sub_district_id
    click_on "Create Citizen association"

    assert_text "Citizen association was successfully created"
    click_on "Back"
  end

  test "updating a Citizen association" do
    visit main_citizen_associations_url
    click_on "Edit", match: :first

    fill_in "Citizen association", with: @main_citizen_association.citizen_association
    fill_in "Main sub district", with: @main_citizen_association.main_sub_district_id
    click_on "Update Citizen association"

    assert_text "Citizen association was successfully updated"
    click_on "Back"
  end

  test "destroying a Citizen association" do
    visit main_citizen_associations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Citizen association was successfully destroyed"
  end
end
