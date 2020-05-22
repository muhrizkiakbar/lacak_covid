require "application_system_test_case"

class LSix::FOutTownDestsTest < ApplicationSystemTestCase
  setup do
    @l_six_f_out_town_dest = l_six_f_out_town_dests(:one)
  end

  test "visiting the index" do
    visit l_six_f_out_town_dests_url
    assert_selector "h1", text: "L Six/F Out Town Dests"
  end

  test "creating a F out town dest" do
    visit l_six_f_out_town_dests_url
    click_on "New L Six/F Out Town Dest"

    fill_in "City", with: @l_six_f_out_town_dest.city
    fill_in "Date arrive", with: @l_six_f_out_town_dest.date_arrive
    fill_in "Province", with: @l_six_f_out_town_dest.province
    fill_in "Travel date", with: @l_six_f_out_town_dest.travel_date
    click_on "Create F out town dest"

    assert_text "F out town dest was successfully created"
    click_on "Back"
  end

  test "updating a F out town dest" do
    visit l_six_f_out_town_dests_url
    click_on "Edit", match: :first

    fill_in "City", with: @l_six_f_out_town_dest.city
    fill_in "Date arrive", with: @l_six_f_out_town_dest.date_arrive
    fill_in "Province", with: @l_six_f_out_town_dest.province
    fill_in "Travel date", with: @l_six_f_out_town_dest.travel_date
    click_on "Update F out town dest"

    assert_text "F out town dest was successfully updated"
    click_on "Back"
  end

  test "destroying a F out town dest" do
    visit l_six_f_out_town_dests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "F out town dest was successfully destroyed"
  end
end
