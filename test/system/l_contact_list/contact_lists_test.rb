require "application_system_test_case"

class LContactList::ContactListsTest < ApplicationSystemTestCase
  setup do
    @l_contact_list_contact_list = l_contact_list_contact_lists(:one)
  end

  test "visiting the index" do
    visit l_contact_list_contact_lists_url
    assert_selector "h1", text: "L Contact List/Contact Lists"
  end

  test "creating a Contact list" do
    visit l_contact_list_contact_lists_url
    click_on "New L Contact List/Contact List"

    fill_in "Date contact", with: @l_contact_list_contact_list.date_contact
    click_on "Create Contact list"

    assert_text "Contact list was successfully created"
    click_on "Back"
  end

  test "updating a Contact list" do
    visit l_contact_list_contact_lists_url
    click_on "Edit", match: :first

    fill_in "Date contact", with: @l_contact_list_contact_list.date_contact
    click_on "Update Contact list"

    assert_text "Contact list was successfully updated"
    click_on "Back"
  end

  test "destroying a Contact list" do
    visit l_contact_list_contact_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contact list was successfully destroyed"
  end
end
