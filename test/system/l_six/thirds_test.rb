require "application_system_test_case"

class LSix::ThirdsTest < ApplicationSystemTestCase
  setup do
    @l_six_third = l_six_thirds(:one)
  end

  test "visiting the index" do
    visit l_six_thirds_url
    assert_selector "h1", text: "L Six/Thirds"
  end

  test "creating a Third" do
    visit l_six_thirds_url
    click_on "New L Six/Third"

    fill_in "Date nasopharyngeal", with: @l_six_third.date_nasopharyngeal
    fill_in "Date oropharyngeal", with: @l_six_third.date_oropharyngeal
    fill_in "Date serum", with: @l_six_third.date_serum
    fill_in "Date sputum", with: @l_six_third.date_sputum
    fill_in "L six third", with: @l_six_third.l_six_third_id
    fill_in "Place nasopharyngeal", with: @l_six_third.place_nasopharyngeal
    fill_in "Place oropharyngeal", with: @l_six_third.place_oropharyngeal
    fill_in "Place serum", with: @l_six_third.place_serum
    fill_in "Place sputum", with: @l_six_third.place_sputum
    fill_in "Result nasopharyngeal", with: @l_six_third.result_nasopharyngeal
    fill_in "Result oropharyngeal", with: @l_six_third.result_oropharyngeal
    fill_in "Result serum", with: @l_six_third.result_serum
    fill_in "Result sputum", with: @l_six_third.result_sputum
    click_on "Create Third"

    assert_text "Third was successfully created"
    click_on "Back"
  end

  test "updating a Third" do
    visit l_six_thirds_url
    click_on "Edit", match: :first

    fill_in "Date nasopharyngeal", with: @l_six_third.date_nasopharyngeal
    fill_in "Date oropharyngeal", with: @l_six_third.date_oropharyngeal
    fill_in "Date serum", with: @l_six_third.date_serum
    fill_in "Date sputum", with: @l_six_third.date_sputum
    fill_in "L six third", with: @l_six_third.l_six_third_id
    fill_in "Place nasopharyngeal", with: @l_six_third.place_nasopharyngeal
    fill_in "Place oropharyngeal", with: @l_six_third.place_oropharyngeal
    fill_in "Place serum", with: @l_six_third.place_serum
    fill_in "Place sputum", with: @l_six_third.place_sputum
    fill_in "Result nasopharyngeal", with: @l_six_third.result_nasopharyngeal
    fill_in "Result oropharyngeal", with: @l_six_third.result_oropharyngeal
    fill_in "Result serum", with: @l_six_third.result_serum
    fill_in "Result sputum", with: @l_six_third.result_sputum
    click_on "Update Third"

    assert_text "Third was successfully updated"
    click_on "Back"
  end

  test "destroying a Third" do
    visit l_six_thirds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Third was successfully destroyed"
  end
end
