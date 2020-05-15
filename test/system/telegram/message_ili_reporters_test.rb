require "application_system_test_case"

class Telegram::MessageIliReportersTest < ApplicationSystemTestCase
  setup do
    @telegram_message_ili_reporter = telegram_message_ili_reporters(:one)
  end

  test "visiting the index" do
    visit telegram_message_ili_reporters_url
    assert_selector "h1", text: "Telegram/Message Ili Reporters"
  end

  test "creating a Message ili reporter" do
    visit telegram_message_ili_reporters_url
    click_on "New Telegram/Message Ili Reporter"

    fill_in "Chat", with: @telegram_message_ili_reporter.chat_id
    fill_in "Message", with: @telegram_message_ili_reporter.message
    fill_in "Telegram username reporter", with: @telegram_message_ili_reporter.telegram_username_reporter_id
    fill_in "Username telegram", with: @telegram_message_ili_reporter.username_telegram
    click_on "Create Message ili reporter"

    assert_text "Message ili reporter was successfully created"
    click_on "Back"
  end

  test "updating a Message ili reporter" do
    visit telegram_message_ili_reporters_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @telegram_message_ili_reporter.chat_id
    fill_in "Message", with: @telegram_message_ili_reporter.message
    fill_in "Telegram username reporter", with: @telegram_message_ili_reporter.telegram_username_reporter_id
    fill_in "Username telegram", with: @telegram_message_ili_reporter.username_telegram
    click_on "Update Message ili reporter"

    assert_text "Message ili reporter was successfully updated"
    click_on "Back"
  end

  test "destroying a Message ili reporter" do
    visit telegram_message_ili_reporters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message ili reporter was successfully destroyed"
  end
end
