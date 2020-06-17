require 'test_helper'

class LContactList::ContactListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_contact_list_contact_list = l_contact_list_contact_lists(:one)
  end

  test "should get index" do
    get l_contact_list_contact_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_l_contact_list_contact_list_url
    assert_response :success
  end

  test "should create l_contact_list_contact_list" do
    assert_difference('LContactList::ContactList.count') do
      post l_contact_list_contact_lists_url, params: { l_contact_list_contact_list: { date_contact: @l_contact_list_contact_list.date_contact } }
    end

    assert_redirected_to l_contact_list_contact_list_url(LContactList::ContactList.last)
  end

  test "should show l_contact_list_contact_list" do
    get l_contact_list_contact_list_url(@l_contact_list_contact_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_contact_list_contact_list_url(@l_contact_list_contact_list)
    assert_response :success
  end

  test "should update l_contact_list_contact_list" do
    patch l_contact_list_contact_list_url(@l_contact_list_contact_list), params: { l_contact_list_contact_list: { date_contact: @l_contact_list_contact_list.date_contact } }
    assert_redirected_to l_contact_list_contact_list_url(@l_contact_list_contact_list)
  end

  test "should destroy l_contact_list_contact_list" do
    assert_difference('LContactList::ContactList.count', -1) do
      delete l_contact_list_contact_list_url(@l_contact_list_contact_list)
    end

    assert_redirected_to l_contact_list_contact_lists_url
  end
end
