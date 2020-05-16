require "application_system_test_case"

class Telegram::MessageTravelerObserversTest < ApplicationSystemTestCase
  setup do
    @telegram_message_traveler_observer = telegram_message_traveler_observers(:one)
  end

  test "visiting the index" do
    visit telegram_message_traveler_observers_url
    assert_selector "h1", text: "Telegram/Message Traveler Observers"
  end

  test "creating a Message traveler observer" do
    visit telegram_message_traveler_observers_url
    click_on "New Telegram/Message Traveler Observer"

    fill_in "Chat", with: @telegram_message_traveler_observer.chat_id
    fill_in "Message", with: @telegram_message_traveler_observer.message
    fill_in "Telegram username observer", with: @telegram_message_traveler_observer.telegram_username_observer_id
    fill_in "Username telegram", with: @telegram_message_traveler_observer.username_telegram
    click_on "Create Message traveler observer"

    assert_text "Message traveler observer was successfully created"
    click_on "Back"
  end

  test "updating a Message traveler observer" do
    visit telegram_message_traveler_observers_url
    click_on "Edit", match: :first

    fill_in "Chat", with: @telegram_message_traveler_observer.chat_id
    fill_in "Message", with: @telegram_message_traveler_observer.message
    fill_in "Telegram username observer", with: @telegram_message_traveler_observer.telegram_username_observer_id
    fill_in "Username telegram", with: @telegram_message_traveler_observer.username_telegram
    click_on "Update Message traveler observer"

    assert_text "Message traveler observer was successfully updated"
    click_on "Back"
  end

  test "destroying a Message traveler observer" do
    visit telegram_message_traveler_observers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message traveler observer was successfully destroyed"
  end
end
