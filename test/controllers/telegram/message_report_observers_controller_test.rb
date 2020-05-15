require 'test_helper'

class Telegram::MessageReportObserversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telegram_message_report_observer = telegram_message_report_observers(:one)
  end

  test "should get index" do
    get telegram_message_report_observers_url
    assert_response :success
  end

  test "should get new" do
    get new_telegram_message_report_observer_url
    assert_response :success
  end

  test "should create telegram_message_report_observer" do
    assert_difference('Telegram::MessageReportObserver.count') do
      post telegram_message_report_observers_url, params: { telegram_message_report_observer: { message: @telegram_message_report_observer.message, telegram_username_observer_id: @telegram_message_report_observer.telegram_username_observer_id, username_telegram: @telegram_message_report_observer.username_telegram } }
    end

    assert_redirected_to telegram_message_report_observer_url(Telegram::MessageReportObserver.last)
  end

  test "should show telegram_message_report_observer" do
    get telegram_message_report_observer_url(@telegram_message_report_observer)
    assert_response :success
  end

  test "should get edit" do
    get edit_telegram_message_report_observer_url(@telegram_message_report_observer)
    assert_response :success
  end

  test "should update telegram_message_report_observer" do
    patch telegram_message_report_observer_url(@telegram_message_report_observer), params: { telegram_message_report_observer: { message: @telegram_message_report_observer.message, telegram_username_observer_id: @telegram_message_report_observer.telegram_username_observer_id, username_telegram: @telegram_message_report_observer.username_telegram } }
    assert_redirected_to telegram_message_report_observer_url(@telegram_message_report_observer)
  end

  test "should destroy telegram_message_report_observer" do
    assert_difference('Telegram::MessageReportObserver.count', -1) do
      delete telegram_message_report_observer_url(@telegram_message_report_observer)
    end

    assert_redirected_to telegram_message_report_observers_url
  end
end
