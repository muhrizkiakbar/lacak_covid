require "application_system_test_case"

class Telegram::MessageCheckinReportersTest < ApplicationSystemTestCase
  setup do
    @telegram_message_checkin_reporter = telegram_message_checkin_reporters(:one)
  end

  test "visiting the index" do
    visit telegram_message_checkin_reporters_url
    assert_selector "h1", text: "Telegram/Message Checkin Reporters"
  end

  test "creating a Message checkin reporter" do
    visit telegram_message_checkin_reporters_url
    click_on "New Telegram/Message Checkin Reporter"

    fill_in "Chat", with: @telegram_message_checkin_reporter.chat_id
    fill_in "Telegram username reporter", with: @telegram_message_checkin_reporter.telegram_username_reporter_id
    fill_in "Username telegram", with: @telegram_message_checkin_reporter.username_telegram
    click_on "Create Message checkin reporter"

    assert_text "Message checkin reporter was successfully created"
    click_on "Back"
  end

  test "updating a Message checkin reporter" do
    visit telegram_message_checkin_reporters_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @telegram_message_checkin_reporter.chat_id
    fill_in "Telegram username reporter", with: @telegram_message_checkin_reporter.telegram_username_reporter_id
    fill_in "Username telegram", with: @telegram_message_checkin_reporter.username_telegram
    click_on "Update Message checkin reporter"

    assert_text "Message checkin reporter was successfully updated"
    click_on "Back"
  end

  test "destroying a Message checkin reporter" do
    visit telegram_message_checkin_reporters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message checkin reporter was successfully destroyed"
  end
end
