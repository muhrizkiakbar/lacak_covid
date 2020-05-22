require "application_system_test_case"

class LSix::FPositiveDestsTest < ApplicationSystemTestCase
  setup do
    @l_six_f_positive_dest = l_six_f_positive_dests(:one)
  end

  test "visiting the index" do
    visit l_six_f_positive_dests_url
    assert_selector "h1", text: "L Six/F Positive Dests"
  end

  test "creating a F positive dest" do
    visit l_six_f_positive_dests_url
    click_on "New L Six/F Positive Dest"

    fill_in "Address", with: @l_six_f_positive_dest.address
    fill_in "Date contact", with: @l_six_f_positive_dest.date_contact
    fill_in "Last date contact", with: @l_six_f_positive_dest.last_date_contact
    fill_in "Name", with: @l_six_f_positive_dest.name
    fill_in "Relation", with: @l_six_f_positive_dest.relation
    click_on "Create F positive dest"

    assert_text "F positive dest was successfully created"
    click_on "Back"
  end

  test "updating a F positive dest" do
    visit l_six_f_positive_dests_url
    click_on "Edit", match: :first

    fill_in "Address", with: @l_six_f_positive_dest.address
    fill_in "Date contact", with: @l_six_f_positive_dest.date_contact
    fill_in "Last date contact", with: @l_six_f_positive_dest.last_date_contact
    fill_in "Name", with: @l_six_f_positive_dest.name
    fill_in "Relation", with: @l_six_f_positive_dest.relation
    click_on "Update F positive dest"

    assert_text "F positive dest was successfully updated"
    click_on "Back"
  end

  test "destroying a F positive dest" do
    visit l_six_f_positive_dests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "F positive dest was successfully destroyed"
  end
end
