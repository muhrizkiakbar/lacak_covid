require 'test_helper'

class Main::PersonalProtectiveEquipmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_personal_protective_equipment = main_personal_protective_equipments(:one)
  end

  test "should get index" do
    get main_personal_protective_equipments_url
    assert_response :success
  end

  test "should get new" do
    get new_main_personal_protective_equipment_url
    assert_response :success
  end

  test "should create main_personal_protective_equipment" do
    assert_difference('Main::PersonalProtectiveEquipment.count') do
      post main_personal_protective_equipments_url, params: { main_personal_protective_equipment: { personal_protective_equipment: @main_personal_protective_equipment.personal_protective_equipment } }
    end

    assert_redirected_to main_personal_protective_equipment_url(Main::PersonalProtectiveEquipment.last)
  end

  test "should show main_personal_protective_equipment" do
    get main_personal_protective_equipment_url(@main_personal_protective_equipment)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_personal_protective_equipment_url(@main_personal_protective_equipment)
    assert_response :success
  end

  test "should update main_personal_protective_equipment" do
    patch main_personal_protective_equipment_url(@main_personal_protective_equipment), params: { main_personal_protective_equipment: { personal_protective_equipment: @main_personal_protective_equipment.personal_protective_equipment } }
    assert_redirected_to main_personal_protective_equipment_url(@main_personal_protective_equipment)
  end

  test "should destroy main_personal_protective_equipment" do
    assert_difference('Main::PersonalProtectiveEquipment.count', -1) do
      delete main_personal_protective_equipment_url(@main_personal_protective_equipment)
    end

    assert_redirected_to main_personal_protective_equipments_url
  end
end
