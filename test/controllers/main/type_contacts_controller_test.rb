require 'test_helper'

class Main::TypeContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_type_contact = main_type_contacts(:one)
  end

  test "should get index" do
    get main_type_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_main_type_contact_url
    assert_response :success
  end

  test "should create main_type_contact" do
    assert_difference('Main::TypeContact.count') do
      post main_type_contacts_url, params: { main_type_contact: { type_contact: @main_type_contact.type_contact } }
    end

    assert_redirected_to main_type_contact_url(Main::TypeContact.last)
  end

  test "should show main_type_contact" do
    get main_type_contact_url(@main_type_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_main_type_contact_url(@main_type_contact)
    assert_response :success
  end

  test "should update main_type_contact" do
    patch main_type_contact_url(@main_type_contact), params: { main_type_contact: { type_contact: @main_type_contact.type_contact } }
    assert_redirected_to main_type_contact_url(@main_type_contact)
  end

  test "should destroy main_type_contact" do
    assert_difference('Main::TypeContact.count', -1) do
      delete main_type_contact_url(@main_type_contact)
    end

    assert_redirected_to main_type_contacts_url
  end
end
