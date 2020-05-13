require 'test_helper'

class Main::NeighborhoodAssociationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_neighborhood_association = main_neighborhood_associations(:one)
  end

  test "should get index" do
    get main_neighborhood_associations_url
    assert_response :success
  end

  test "should get new" do
    get new_main_neighborhood_association_url
    assert_response :success
  end

  test "should create main_neighborhood_association" do
    assert_difference('Main::NeighborhoodAssociation.count') do
      post main_neighborhood_associations_url, params: { main_neighborhood_association: { main_citizen_association_id: @main_neighborhood_association.main_citizen_association_id, neighborhood_association: @main_neighborhood_association.neighborhood_association } }
    end

    assert_redirected_to main_neighborhood_association_url(Main::NeighborhoodAssociation.last)
  end

  test "should show main_neighborhood_association" do
    get main_neighborhood_association_url(@main_neighborhood_association)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_neighborhood_association_url(@main_neighborhood_association)
    assert_response :success
  end

  test "should update main_neighborhood_association" do
    patch main_neighborhood_association_url(@main_neighborhood_association), params: { main_neighborhood_association: { main_citizen_association_id: @main_neighborhood_association.main_citizen_association_id, neighborhood_association: @main_neighborhood_association.neighborhood_association } }
    assert_redirected_to main_neighborhood_association_url(@main_neighborhood_association)
  end

  test "should destroy main_neighborhood_association" do
    assert_difference('Main::NeighborhoodAssociation.count', -1) do
      delete main_neighborhood_association_url(@main_neighborhood_association)
    end

    assert_redirected_to main_neighborhood_associations_url
  end
end
