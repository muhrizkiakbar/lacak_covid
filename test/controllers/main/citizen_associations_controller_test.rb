require 'test_helper'

class Main::CitizenAssociationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_citizen_association = main_citizen_associations(:one)
  end

  test "should get index" do
    get main_citizen_associations_url
    assert_response :success
  end

  test "should get new" do
    get new_main_citizen_association_url
    assert_response :success
  end

  test "should create main_citizen_association" do
    assert_difference('Main::CitizenAssociation.count') do
      post main_citizen_associations_url, params: { main_citizen_association: { citizen_association: @main_citizen_association.citizen_association, main_sub_district_id: @main_citizen_association.main_sub_district_id } }
    end

    assert_redirected_to main_citizen_association_url(Main::CitizenAssociation.last)
  end

  test "should show main_citizen_association" do
    get main_citizen_association_url(@main_citizen_association)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_citizen_association_url(@main_citizen_association)
    assert_response :success
  end

  test "should update main_citizen_association" do
    patch main_citizen_association_url(@main_citizen_association), params: { main_citizen_association: { citizen_association: @main_citizen_association.citizen_association, main_sub_district_id: @main_citizen_association.main_sub_district_id } }
    assert_redirected_to main_citizen_association_url(@main_citizen_association)
  end

  test "should destroy main_citizen_association" do
    assert_difference('Main::CitizenAssociation.count', -1) do
      delete main_citizen_association_url(@main_citizen_association)
    end

    assert_redirected_to main_citizen_associations_url
  end
end
