require "application_system_test_case"

class LSix::FHospitalDestsTest < ApplicationSystemTestCase
  setup do
    @l_six_f_hospital_dest = l_six_f_hospital_dests(:one)
  end

  test "visiting the index" do
    visit l_six_f_hospital_dests_url
    assert_selector "h1", text: "L Six/F Hospital Dests"
  end

  test "creating a F hospital dest" do
    visit l_six_f_hospital_dests_url
    click_on "New L Six/F Hospital Dest"

    fill_in "City", with: @l_six_f_hospital_dest.city
    fill_in "Hospital", with: @l_six_f_hospital_dest.hospital
    fill_in "Province city", with: @l_six_f_hospital_dest.province_city
    fill_in "Visit date", with: @l_six_f_hospital_dest.visit_date
    click_on "Create F hospital dest"

    assert_text "F hospital dest was successfully created"
    click_on "Back"
  end

  test "updating a F hospital dest" do
    visit l_six_f_hospital_dests_url
    click_on "Edit", match: :first

    fill_in "City", with: @l_six_f_hospital_dest.city
    fill_in "Hospital", with: @l_six_f_hospital_dest.hospital
    fill_in "Province city", with: @l_six_f_hospital_dest.province_city
    fill_in "Visit date", with: @l_six_f_hospital_dest.visit_date
    click_on "Update F hospital dest"

    assert_text "F hospital dest was successfully updated"
    click_on "Back"
  end

  test "destroying a F hospital dest" do
    visit l_six_f_hospital_dests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "F hospital dest was successfully destroyed"
  end
end
