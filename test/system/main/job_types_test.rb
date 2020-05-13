require "application_system_test_case"

class Main::JobTypesTest < ApplicationSystemTestCase
  setup do
    @main_job_type = main_job_types(:one)
  end

  test "visiting the index" do
    visit main_job_types_url
    assert_selector "h1", text: "Main/Job Types"
  end

  test "creating a Job type" do
    visit main_job_types_url
    click_on "New Main/Job Type"

    fill_in "Job type", with: @main_job_type.job_type
    click_on "Create Job type"

    assert_text "Job type was successfully created"
    click_on "Back"
  end

  test "updating a Job type" do
    visit main_job_types_url
    click_on "Edit", match: :first

    fill_in "Job type", with: @main_job_type.job_type
    click_on "Update Job type"

    assert_text "Job type was successfully updated"
    click_on "Back"
  end

  test "destroying a Job type" do
    visit main_job_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job type was successfully destroyed"
  end
end
