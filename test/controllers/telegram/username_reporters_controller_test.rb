require 'test_helper'

class Telegram::UsernameReportersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @telegram_username_reporter = telegram_username_reporters(:one)
  end

  test "should get index" do
    get telegram_username_reporters_url
    assert_response :success
  end

  test "should get new" do
    get new_telegram_username_reporter_url
    assert_response :success
  end

  test "should create telegram_username_reporter" do
    assert_difference('Telegram::UsernameReporter.count') do
      post telegram_username_reporters_url, params: { telegram_username_reporter: { last_activity_at: @telegram_username_reporter.last_activity_at, main_citizen_association_id: @telegram_username_reporter.main_citizen_association_id, main_city_id: @telegram_username_reporter.main_city_id, main_district_id: @telegram_username_reporter.main_district_id, main_neighborhood_association_id: @telegram_username_reporter.main_neighborhood_association_id, main_sub_district_id: @telegram_username_reporter.main_sub_district_id, username_telegram: @telegram_username_reporter.username_telegram } }
    end

    assert_redirected_to telegram_username_reporter_url(Telegram::UsernameReporter.last)
  end

  test "should show telegram_username_reporter" do
    get telegram_username_reporter_url(@telegram_username_reporter)
    assert_response :success
  end

  test "should get edit" do
    get edit_telegram_username_reporter_url(@telegram_username_reporter)
    assert_response :success
  end

  test "should update telegram_username_reporter" do
    patch telegram_username_reporter_url(@telegram_username_reporter), params: { telegram_username_reporter: { last_activity_at: @telegram_username_reporter.last_activity_at, main_citizen_association_id: @telegram_username_reporter.main_citizen_association_id, main_city_id: @telegram_username_reporter.main_city_id, main_district_id: @telegram_username_reporter.main_district_id, main_neighborhood_association_id: @telegram_username_reporter.main_neighborhood_association_id, main_sub_district_id: @telegram_username_reporter.main_sub_district_id, username_telegram: @telegram_username_reporter.username_telegram } }
    assert_redirected_to telegram_username_reporter_url(@telegram_username_reporter)
  end

  test "should destroy telegram_username_reporter" do
    assert_difference('Telegram::UsernameReporter.count', -1) do
      delete telegram_username_reporter_url(@telegram_username_reporter)
    end

    assert_redirected_to telegram_username_reporters_url
  end
end
