require "application_system_test_case"

class LSix::FirstsTest < ApplicationSystemTestCase
  setup do
    @l_six_first = l_six_firsts(:one)
  end

  test "visiting the index" do
    visit l_six_firsts_url
    assert_selector "h1", text: "L Six/Firsts"
  end

  test "creating a First" do
    visit l_six_firsts_url
    click_on "New L Six/First"

    fill_in "Interview date", with: @l_six_first.interview_date
    fill_in "Main patient", with: @l_six_first.main_patient_id
    fill_in "User", with: @l_six_first.user_id
    click_on "Create First"

    assert_text "First was successfully created"
    click_on "Back"
  end

  test "updating a First" do
    visit l_six_firsts_url
    click_on "Edit", match: :first

    fill_in "Interview date", with: @l_six_first.interview_date
    fill_in "Main patient", with: @l_six_first.main_patient_id
    fill_in "User", with: @l_six_first.user_id
    click_on "Update First"

    assert_text "First was successfully updated"
    click_on "Back"
  end

  test "destroying a First" do
    visit l_six_firsts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "First was successfully destroyed"
  end
end
