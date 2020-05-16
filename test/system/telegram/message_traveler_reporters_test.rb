require "application_system_test_case"

class Telegram::MessageTravelerReportersTest < ApplicationSystemTestCase
  setup do
    @telegram_message_traveler_reporter = telegram_message_traveler_reporters(:one)
  end

  test "visiting the index" do
    visit telegram_message_traveler_reporters_url
    assert_selector "h1", text: "Telegram/Message Traveler Reporters"
  end

  test "creating a Message traveler reporter" do
    visit telegram_message_traveler_reporters_url
    click_on "New Telegram/Message Traveler Reporter"

    fill_in "Chat", with: @telegram_message_traveler_reporter.chat_id
    fill_in "Message", with: @telegram_message_traveler_reporter.message
    fill_in "Telegram username reporter", with: @telegram_message_traveler_reporter.telegram_username_reporter_id
    fill_in "Username telegram", with: @telegram_message_traveler_reporter.username_telegram
    click_on "Create Message traveler reporter"

    assert_text "Message traveler reporter was successfully created"
    click_on "Back"
  end

  test "updating a Message traveler reporter" do
    visit telegram_message_traveler_reporters_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @telegram_message_traveler_reporter.chat_id
    fill_in "Message", with: @telegram_message_traveler_reporter.message
    fill_in "Telegram username reporter", with: @telegram_message_traveler_reporter.telegram_username_reporter_id
    fill_in "Username telegram", with: @telegram_message_traveler_reporter.username_telegram
    click_on "Update Message traveler reporter"

    assert_text "Message traveler reporter was successfully updated"
    click_on "Back"
  end

  test "destroying a Message traveler reporter" do
    visit telegram_message_traveler_reporters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message traveler reporter was successfully destroyed"
  end
end
