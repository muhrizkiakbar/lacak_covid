require 'test_helper'

class Telegram::MessageIliReportersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telegram_message_ili_reporter = telegram_message_ili_reporters(:one)
  end

  test "should get index" do
    get telegram_message_ili_reporters_url
    assert_response :success
  end

  test "should get new" do
    get new_telegram_message_ili_reporter_url
    assert_response :success
  end

  test "should create telegram_message_ili_reporter" do
    assert_difference('Telegram::MessageIliReporter.count') do
      post telegram_message_ili_reporters_url, params: { telegram_message_ili_reporter: { chat_id: @telegram_message_ili_reporter.chat_id, message: @telegram_message_ili_reporter.message, telegram_username_reporter_id: @telegram_message_ili_reporter.telegram_username_reporter_id, username_telegram: @telegram_message_ili_reporter.username_telegram } }
    end

    assert_redirected_to telegram_message_ili_reporter_url(Telegram::MessageIliReporter.last)
  end

  test "should show telegram_message_ili_reporter" do
    get telegram_message_ili_reporter_url(@telegram_message_ili_reporter)
    assert_response :success
  end

  test "should get edit" do
    get edit_telegram_message_ili_reporter_url(@telegram_message_ili_reporter)
    assert_response :success
  end

  test "should update telegram_message_ili_reporter" do
    patch telegram_message_ili_reporter_url(@telegram_message_ili_reporter), params: { telegram_message_ili_reporter: { chat_id: @telegram_message_ili_reporter.chat_id, message: @telegram_message_ili_reporter.message, telegram_username_reporter_id: @telegram_message_ili_reporter.telegram_username_reporter_id, username_telegram: @telegram_message_ili_reporter.username_telegram } }
    assert_redirected_to telegram_message_ili_reporter_url(@telegram_message_ili_reporter)
  end

  test "should destroy telegram_message_ili_reporter" do
    assert_difference('Telegram::MessageIliReporter.count', -1) do
      delete telegram_message_ili_reporter_url(@telegram_message_ili_reporter)
    end

    assert_redirected_to telegram_message_ili_reporters_url
  end
end
