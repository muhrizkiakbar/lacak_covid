require 'test_helper'

class Main::DinkesRegionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_dinkes_region = main_dinkes_regions(:one)
  end

  test "should get index" do
    get main_dinkes_regions_url
    assert_response :success
  end

  test "should get new" do
    get new_main_dinkes_region_url
    assert_response :success
  end

  test "should create main_dinkes_region" do
    assert_difference('Main::DinkesRegion.count') do
      post main_dinkes_regions_url, params: { main_dinkes_region: { dinkes_region: @main_dinkes_region.dinkes_region, main_dinkes_province_id: @main_dinkes_region.main_dinkes_province_id } }
    end

    assert_redirected_to main_dinkes_region_url(Main::DinkesRegion.last)
  end

  test "should show main_dinkes_region" do
    get main_dinkes_region_url(@main_dinkes_region)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_dinkes_region_url(@main_dinkes_region)
    assert_response :success
  end

  test "should update main_dinkes_region" do
    patch main_dinkes_region_url(@main_dinkes_region), params: { main_dinkes_region: { dinkes_region: @main_dinkes_region.dinkes_region, main_dinkes_province_id: @main_dinkes_region.main_dinkes_province_id } }
    assert_redirected_to main_dinkes_region_url(@main_dinkes_region)
  end

  test "should destroy main_dinkes_region" do
    assert_difference('Main::DinkesRegion.count', -1) do
      delete main_dinkes_region_url(@main_dinkes_region)
    end

    assert_redirected_to main_dinkes_regions_url
  end
end
