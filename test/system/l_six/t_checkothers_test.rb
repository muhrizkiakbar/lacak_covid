require "application_system_test_case"

class LSix::TCheckothersTest < ApplicationSystemTestCase
  setup do
    @l_six_t_checkother = l_six_t_checkothers(:one)
  end

  test "visiting the index" do
    visit l_six_t_checkothers_url
    assert_selector "h1", text: "L Six/T Checkothers"
  end

  test "creating a T checkother" do
    visit l_six_t_checkothers_url
    click_on "New L Six/T Checkother"

    fill_in "Date check other", with: @l_six_t_checkother.date_check_other
    fill_in "L six third", with: @l_six_t_checkother.l_six_third_id
    fill_in "Other check", with: @l_six_t_checkother.other_check
    fill_in "Place check other", with: @l_six_t_checkother.place_check_other
    fill_in "Result check other", with: @l_six_t_checkother.result_check_other
    click_on "Create T checkother"

    assert_text "T checkother was successfully created"
    click_on "Back"
  end

  test "updating a T checkother" do
    visit l_six_t_checkothers_url
    click_on "Edit", match: :first

    fill_in "Date check other", with: @l_six_t_checkother.date_check_other
    fill_in "L six third", with: @l_six_t_checkother.l_six_third_id
    fill_in "Other check", with: @l_six_t_checkother.other_check
    fill_in "Place check other", with: @l_six_t_checkother.place_check_other
    fill_in "Result check other", with: @l_six_t_checkother.result_check_other
    click_on "Update T checkother"

    assert_text "T checkother was successfully updated"
    click_on "Back"
  end

  test "destroying a T checkother" do
    visit l_six_t_checkothers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "T checkother was successfully destroyed"
  end
end
