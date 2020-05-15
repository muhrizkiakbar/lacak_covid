require 'test_helper'

class Telegram::UsernameObserversControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telegram_username_observer = telegram_username_observers(:one)
  end

  test "should get index" do
    get telegram_username_observers_url
    assert_response :success
  end

  test "should get new" do
    get new_telegram_username_observer_url
    assert_response :success
  end

  test "should create telegram_username_observer" do
    assert_difference('Telegram::UsernameObserver.count') do
      post telegram_username_observers_url, params: { telegram_username_observer: { last_activity_at: @telegram_username_observer.last_activity_at, main_dinkes_province_id: @telegram_username_observer.main_dinkes_province_id, main_dinkes_region_id: @telegram_username_observer.main_dinkes_region_id, main_hospital_id: @telegram_username_observer.main_hospital_id, main_public_health_center_id: @telegram_username_observer.main_public_health_center_id, user_id: @telegram_username_observer.user_id, username_telegram: @telegram_username_observer.username_telegram } }
    end

    assert_redirected_to telegram_username_observer_url(Telegram::UsernameObserver.last)
  end

  test "should show telegram_username_observer" do
    get telegram_username_observer_url(@telegram_username_observer)
    assert_response :success
  end

  test "should get edit" do
    get edit_telegram_username_observer_url(@telegram_username_observer)
    assert_response :success
  end

  test "should update telegram_username_observer" do
    patch telegram_username_observer_url(@telegram_username_observer), params: { telegram_username_observer: { last_activity_at: @telegram_username_observer.last_activity_at, main_dinkes_province_id: @telegram_username_observer.main_dinkes_province_id, main_dinkes_region_id: @telegram_username_observer.main_dinkes_region_id, main_hospital_id: @telegram_username_observer.main_hospital_id, main_public_health_center_id: @telegram_username_observer.main_public_health_center_id, user_id: @telegram_username_observer.user_id, username_telegram: @telegram_username_observer.username_telegram } }
    assert_redirected_to telegram_username_observer_url(@telegram_username_observer)
  end

  test "should destroy telegram_username_observer" do
    assert_difference('Telegram::UsernameObserver.count', -1) do
      delete telegram_username_observer_url(@telegram_username_observer)
    end

    assert_redirected_to telegram_username_observers_url
  end
end
