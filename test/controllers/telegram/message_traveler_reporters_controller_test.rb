require 'test_helper'

class Telegram::MessageTravelerReportersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telegram_message_traveler_reporter = telegram_message_traveler_reporters(:one)
  end

  test "should get index" do
    get telegram_message_traveler_reporters_url
    assert_response :success
  end

  test "should get new" do
    get new_telegram_message_traveler_reporter_url
    assert_response :success
  end

  test "should create telegram_message_traveler_reporter" do
    assert_difference('Telegram::MessageTravelerReporter.count') do
      post telegram_message_traveler_reporters_url, params: { telegram_message_traveler_reporter: { chat_id: @telegram_message_traveler_reporter.chat_id, message: @telegram_message_traveler_reporter.message, telegram_username_reporter_id: @telegram_message_traveler_reporter.telegram_username_reporter_id, username_telegram: @telegram_message_traveler_reporter.username_telegram } }
    end

    assert_redirected_to telegram_message_traveler_reporter_url(Telegram::MessageTravelerReporter.last)
  end

  test "should show telegram_message_traveler_reporter" do
    get telegram_message_traveler_reporter_url(@telegram_message_traveler_reporter)
    assert_response :success
  end

  test "should get edit" do
    get edit_telegram_message_traveler_reporter_url(@telegram_message_traveler_reporter)
    assert_response :success
  end

  test "should update telegram_message_traveler_reporter" do
    patch telegram_message_traveler_reporter_url(@telegram_message_traveler_reporter), params: { telegram_message_traveler_reporter: { chat_id: @telegram_message_traveler_reporter.chat_id, message: @telegram_message_traveler_reporter.message, telegram_username_reporter_id: @telegram_message_traveler_reporter.telegram_username_reporter_id, username_telegram: @telegram_message_traveler_reporter.username_telegram } }
    assert_redirected_to telegram_message_traveler_reporter_url(@telegram_message_traveler_reporter)
  end

  test "should destroy telegram_message_traveler_reporter" do
    assert_difference('Telegram::MessageTravelerReporter.count', -1) do
      delete telegram_message_traveler_reporter_url(@telegram_message_traveler_reporter)
    end

    assert_redirected_to telegram_message_traveler_reporters_url
  end
end
