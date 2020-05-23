require "application_system_test_case"

class LSix::FifthsTest < ApplicationSystemTestCase
  setup do
    @l_six_fifth = l_six_fifths(:one)
  end

  test "visiting the index" do
    visit l_six_fifths_url
    assert_selector "h1", text: "L Six/Fifths"
  end

  test "creating a Fifth" do
    visit l_six_fifths_url
    click_on "New L Six/Fifth"

    fill_in "Activity", with: @l_six_fifth.activity
    fill_in "Address", with: @l_six_fifth.address
    fill_in "Date of birth", with: @l_six_fifth.date_of_birth
    fill_in "Gender", with: @l_six_fifth.gender
    fill_in "L six first", with: @l_six_fifth.l_six_first_id
    fill_in "Name", with: @l_six_fifth.name
    fill_in "Phone number", with: @l_six_fifth.phone_number
    fill_in "Relation", with: @l_six_fifth.relation
    click_on "Create Fifth"

    assert_text "Fifth was successfully created"
    click_on "Back"
  end

  test "updating a Fifth" do
    visit l_six_fifths_url
    click_on "Edit", match: :first

    fill_in "Activity", with: @l_six_fifth.activity
    fill_in "Address", with: @l_six_fifth.address
    fill_in "Date of birth", with: @l_six_fifth.date_of_birth
    fill_in "Gender", with: @l_six_fifth.gender
    fill_in "L six first", with: @l_six_fifth.l_six_first_id
    fill_in "Name", with: @l_six_fifth.name
    fill_in "Phone number", with: @l_six_fifth.phone_number
    fill_in "Relation", with: @l_six_fifth.relation
    click_on "Update Fifth"

    assert_text "Fifth was successfully updated"
    click_on "Back"
  end

  test "destroying a Fifth" do
    visit l_six_fifths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fifth was successfully destroyed"
  end
end
