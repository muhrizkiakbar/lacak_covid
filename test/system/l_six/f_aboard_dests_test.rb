require "application_system_test_case"

class LSix::FAboardDestsTest < ApplicationSystemTestCase
  setup do
    @l_six_f_aboard_dest = l_six_f_aboard_dests(:one)
  end

  test "visiting the index" do
    visit l_six_f_aboard_dests_url
    assert_selector "h1", text: "L Six/F Aboard Dests"
  end

  test "creating a F aboard dest" do
    visit l_six_f_aboard_dests_url
    click_on "New L Six/F Aboard Dest"

    fill_in "City", with: @l_six_f_aboard_dest.city
    fill_in "Country", with: @l_six_f_aboard_dest.country
    fill_in "Date arrive", with: @l_six_f_aboard_dest.date_arrive
    fill_in "Travel date", with: @l_six_f_aboard_dest.travel_date
    click_on "Create F aboard dest"

    assert_text "F aboard dest was successfully created"
    click_on "Back"
  end

  test "updating a F aboard dest" do
    visit l_six_f_aboard_dests_url
    click_on "Edit", match: :first

    fill_in "City", with: @l_six_f_aboard_dest.city
    fill_in "Country", with: @l_six_f_aboard_dest.country
    fill_in "Date arrive", with: @l_six_f_aboard_dest.date_arrive
    fill_in "Travel date", with: @l_six_f_aboard_dest.travel_date
    click_on "Update F aboard dest"

    assert_text "F aboard dest was successfully updated"
    click_on "Back"
  end

  test "destroying a F aboard dest" do
    visit l_six_f_aboard_dests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "F aboard dest was successfully destroyed"
  end
end
