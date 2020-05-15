require "application_system_test_case"

class Telegram::UsernameObserversTest < ApplicationSystemTestCase
  setup do
    @telegram_username_observer = telegram_username_observers(:one)
  end

  test "visiting the index" do
    visit telegram_username_observers_url
    assert_selector "h1", text: "Telegram/Username Observers"
  end

  test "creating a Username observer" do
    visit telegram_username_observers_url
    click_on "New Telegram/Username Observer"

    fill_in "Last activity at", with: @telegram_username_observer.last_activity_at
    fill_in "Main dinkes province", with: @telegram_username_observer.main_dinkes_province_id
    fill_in "Main dinkes region", with: @telegram_username_observer.main_dinkes_region_id
    fill_in "Main hospital", with: @telegram_username_observer.main_hospital_id
    fill_in "Main public health center", with: @telegram_username_observer.main_public_health_center_id
    fill_in "User", with: @telegram_username_observer.user_id
    fill_in "Username telegram", with: @telegram_username_observer.username_telegram
    click_on "Create Username observer"

    assert_text "Username observer was successfully created"
    click_on "Back"
  end

  test "updating a Username observer" do
    visit telegram_username_observers_url
    click_on "Edit", match: :first

    fill_in "Last activity at", with: @telegram_username_observer.last_activity_at
    fill_in "Main dinkes province", with: @telegram_username_observer.main_dinkes_province_id
    fill_in "Main dinkes region", with: @telegram_username_observer.main_dinkes_region_id
    fill_in "Main hospital", with: @telegram_username_observer.main_hospital_id
    fill_in "Main public health center", with: @telegram_username_observer.main_public_health_center_id
    fill_in "User", with: @telegram_username_observer.user_id
    fill_in "Username telegram", with: @telegram_username_observer.username_telegram
    click_on "Update Username observer"

    assert_text "Username observer was successfully updated"
    click_on "Back"
  end

  test "destroying a Username observer" do
    visit telegram_username_observers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Username observer was successfully destroyed"
  end
end
