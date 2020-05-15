require "application_system_test_case"

class Telegram::MessageReportObserversTest < ApplicationSystemTestCase
  setup do
    @telegram_message_report_observer = telegram_message_report_observers(:one)
  end

  test "visiting the index" do
    visit telegram_message_report_observers_url
    assert_selector "h1", text: "Telegram/Message Report Observers"
  end

  test "creating a Message report observer" do
    visit telegram_message_report_observers_url
    click_on "New Telegram/Message Report Observer"

    fill_in "Message", with: @telegram_message_report_observer.message
    fill_in "Telegram username observer", with: @telegram_message_report_observer.telegram_username_observer_id
    fill_in "Username telegram", with: @telegram_message_report_observer.username_telegram
    click_on "Create Message report observer"

    assert_text "Message report observer was successfully created"
    click_on "Back"
  end

  test "updating a Message report observer" do
    visit telegram_message_report_observers_url
    click_on "Edit", match: :first

    fill_in "Message", with: @telegram_message_report_observer.message
    fill_in "Telegram username observer", with: @telegram_message_report_observer.telegram_username_observer_id
    fill_in "Username telegram", with: @telegram_message_report_observer.username_telegram
    click_on "Update Message report observer"

    assert_text "Message report observer was successfully updated"
    click_on "Back"
  end

  test "destroying a Message report observer" do
    visit telegram_message_report_observers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message report observer was successfully destroyed"
  end
end
