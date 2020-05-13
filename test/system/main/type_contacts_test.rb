require "application_system_test_case"

class Main::TypeContactsTest < ApplicationSystemTestCase
  setup do
    @main_type_contact = main_type_contacts(:one)
  end

  test "visiting the index" do
    visit main_type_contacts_url
    assert_selector "h1", text: "Main/Type Contacts"
  end

  test "creating a Type contact" do
    visit main_type_contacts_url
    click_on "New Main/Type Contact"

    fill_in "Type contact", with: @main_type_contact.type_contact
    click_on "Create Type contact"

    assert_text "Type contact was successfully created"
    click_on "Back"
  end

  test "updating a Type contact" do
    visit main_type_contacts_url
    click_on "Edit", match: :first

    fill_in "Type contact", with: @main_type_contact.type_contact
    click_on "Update Type contact"

    assert_text "Type contact was successfully updated"
    click_on "Back"
  end

  test "destroying a Type contact" do
    visit main_type_contacts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type contact was successfully destroyed"
  end
end
