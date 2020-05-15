require "application_system_test_case"

class Telegram::MessageIliObserversTest < ApplicationSystemTestCase
  setup do
    @telegram_message_ili_observer = telegram_message_ili_observers(:one)
  end

  test "visiting the index" do
    visit telegram_message_ili_observers_url
    assert_selector "h1", text: "Telegram/Message Ili Observers"
  end

  test "creating a Message ili observer" do
    visit telegram_message_ili_observers_url
    click_on "New Telegram/Message Ili Observer"

    fill_in "Chat", with: @telegram_message_ili_observer.chat_id
    fill_in "Message", with: @telegram_message_ili_observer.message
    fill_in "Telegram username observer", with: @telegram_message_ili_observer.telegram_username_observer_id
    fill_in "Username telegram", with: @telegram_message_ili_observer.username_telegram
    click_on "Create Message ili observer"

    assert_text "Message ili observer was successfully created"
    click_on "Back"
  end

  test "updating a Message ili observer" do
    visit telegram_message_ili_observers_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @telegram_message_ili_observer.chat_id
    fill_in "Message", with: @telegram_message_ili_observer.message
    fill_in "Telegram username observer", with: @telegram_message_ili_observer.telegram_username_observer_id
    fill_in "Username telegram", with: @telegram_message_ili_observer.username_telegram
    click_on "Update Message ili observer"

    assert_text "Message ili observer was successfully updated"
    click_on "Back"
  end

  test "destroying a Message ili observer" do
    visit telegram_message_ili_observers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message ili observer was successfully destroyed"
  end
end
