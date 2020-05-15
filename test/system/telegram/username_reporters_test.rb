require "application_system_test_case"

class Telegram::UsernameReportersTest < ApplicationSystemTestCase
  setup do
    @telegram_username_reporter = telegram_username_reporters(:one)
  end

  test "visiting the index" do
    visit telegram_username_reporters_url
    assert_selector "h1", text: "Telegram/Username Reporters"
  end

  test "creating a Username reporter" do
    visit telegram_username_reporters_url
    click_on "New Telegram/Username Reporter"

    fill_in "Last activity at", with: @telegram_username_reporter.last_activity_at
    fill_in "Main citizen association", with: @telegram_username_reporter.main_citizen_association_id
    fill_in "Main city", with: @telegram_username_reporter.main_city_id
    fill_in "Main district", with: @telegram_username_reporter.main_district_id
    fill_in "Main neighborhood association", with: @telegram_username_reporter.main_neighborhood_association_id
    fill_in "Main sub district", with: @telegram_username_reporter.main_sub_district_id
    fill_in "Username telegram", with: @telegram_username_reporter.username_telegram
    click_on "Create Username reporter"

    assert_text "Username reporter was successfully created"
    click_on "Back"
  end

  test "updating a Username reporter" do
    visit telegram_username_reporters_url
    click_on "Edit", match: :first

    fill_in "Last activity at", with: @telegram_username_reporter.last_activity_at
    fill_in "Main citizen association", with: @telegram_username_reporter.main_citizen_association_id
    fill_in "Main city", with: @telegram_username_reporter.main_city_id
    fill_in "Main district", with: @telegram_username_reporter.main_district_id
    fill_in "Main neighborhood association", with: @telegram_username_reporter.main_neighborhood_association_id
    fill_in "Main sub district", with: @telegram_username_reporter.main_sub_district_id
    fill_in "Username telegram", with: @telegram_username_reporter.username_telegram
    click_on "Update Username reporter"

    assert_text "Username reporter was successfully updated"
    click_on "Back"
  end

  test "destroying a Username reporter" do
    visit telegram_username_reporters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Username reporter was successfully destroyed"
  end
end
