require "application_system_test_case"

class Main::PersonalProtectiveEquipmentsTest < ApplicationSystemTestCase
  setup do
    @main_personal_protective_equipment = main_personal_protective_equipments(:one)
  end

  test "visiting the index" do
    visit main_personal_protective_equipments_url
    assert_selector "h1", text: "Main/Personal Protective Equipments"
  end

  test "creating a Personal protective equipment" do
    visit main_personal_protective_equipments_url
    click_on "New Main/Personal Protective Equipment"

    fill_in "Personal protective equipment", with: @main_personal_protective_equipment.personal_protective_equipment
    click_on "Create Personal protective equipment"

    assert_text "Personal protective equipment was successfully created"
    click_on "Back"
  end

  test "updating a Personal protective equipment" do
    visit main_personal_protective_equipments_url
    click_on "Edit", match: :first

    fill_in "Personal protective equipment", with: @main_personal_protective_equipment.personal_protective_equipment
    click_on "Update Personal protective equipment"

    assert_text "Personal protective equipment was successfully updated"
    click_on "Back"
  end

  test "destroying a Personal protective equipment" do
    visit main_personal_protective_equipments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Personal protective equipment was successfully destroyed"
  end
end
