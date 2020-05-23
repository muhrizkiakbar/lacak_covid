require "application_system_test_case"

class LSix::FAnimalDestsTest < ApplicationSystemTestCase
  setup do
    @l_six_f_animal_dest = l_six_f_animal_dests(:one)
  end

  test "visiting the index" do
    visit l_six_f_animal_dests_url
    assert_selector "h1", text: "L Six/F Animal Dests"
  end

  test "creating a F animal dest" do
    visit l_six_f_animal_dests_url
    click_on "New L Six/F Animal Dest"

    fill_in "City", with: @l_six_f_animal_dest.city
    fill_in "Location", with: @l_six_f_animal_dest.location
    fill_in "Province city", with: @l_six_f_animal_dest.province_city
    fill_in "Visit date", with: @l_six_f_animal_dest.visit_date
    click_on "Create F animal dest"

    assert_text "F animal dest was successfully created"
    click_on "Back"
  end

  test "updating a F animal dest" do
    visit l_six_f_animal_dests_url
    click_on "Edit", match: :first

    fill_in "City", with: @l_six_f_animal_dest.city
    fill_in "Location", with: @l_six_f_animal_dest.location
    fill_in "Province city", with: @l_six_f_animal_dest.province_city
    fill_in "Visit date", with: @l_six_f_animal_dest.visit_date
    click_on "Update F animal dest"

    assert_text "F animal dest was successfully updated"
    click_on "Back"
  end

  test "destroying a F animal dest" do
    visit l_six_f_animal_dests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "F animal dest was successfully destroyed"
  end
end