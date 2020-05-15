require "application_system_test_case"

class Telegram::MessageReportReportersTest < ApplicationSystemTestCase
  setup do
    @telegram_message_report_reporter = telegram_message_report_reporters(:one)
  end

  test "visiting the index" do
    visit telegram_message_report_reporters_url
    assert_selector "h1", text: "Telegram/Message Report Reporters"
  end

  test "creating a Message report reporter" do
    visit telegram_message_report_reporters_url
    click_on "New Telegram/Message Report Reporter"

    fill_in "Message", with: @telegram_message_report_reporter.message
    fill_in "Telegram username reporter", with: @telegram_message_report_reporter.telegram_username_reporter_id
    fill_in "Username telegram", with: @telegram_message_report_reporter.username_telegram
    click_on "Create Message report reporter"

    assert_text "Message report reporter was successfully created"
    click_on "Back"
  end

  test "updating a Message report reporter" do
    visit telegram_message_report_reporters_url
    click_on "Edit", match: :first

    fill_in "Message", with: @telegram_message_report_reporter.message
    fill_in "Telegram username reporter", with: @telegram_message_report_reporter.telegram_username_reporter_id
    fill_in "Username telegram", with: @telegram_message_report_reporter.username_telegram
    click_on "Update Message report reporter"

    assert_text "Message report reporter was successfully updated"
    click_on "Back"
  end

  test "destroying a Message report reporter" do
    visit telegram_message_report_reporters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message report reporter was successfully destroyed"
  end
end
