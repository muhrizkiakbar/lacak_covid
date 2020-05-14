require "application_system_test_case"

class Main::JobPositionsTest < ApplicationSystemTestCase
  setup do
    @main_job_position = main_job_positions(:one)
  end

  test "visiting the index" do
    visit main_job_positions_url
    assert_selector "h1", text: "Main/Job Positions"
  end

  test "creating a Job position" do
    visit main_job_positions_url
    click_on "New Main/Job Position"

    fill_in "Job position", with: @main_job_position.job_position
    click_on "Create Job position"

    assert_text "Job position was successfully created"
    click_on "Back"
  end

  test "updating a Job position" do
    visit main_job_positions_url
    click_on "Edit", match: :first

    fill_in "Job position", with: @main_job_position.job_position
    click_on "Update Job position"

    assert_text "Job position was successfully updated"
    click_on "Back"
  end

  test "destroying a Job position" do
    visit main_job_positions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job position was successfully destroyed"
  end
end
