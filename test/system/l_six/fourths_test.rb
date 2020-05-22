require "application_system_test_case"

class LSix::FourthsTest < ApplicationSystemTestCase
  setup do
    @l_six_fourth = l_six_fourths(:one)
  end

  test "visiting the index" do
    visit l_six_fourths_url
    assert_selector "h1", text: "L Six/Fourths"
  end

  test "creating a Fourth" do
    visit l_six_fourths_url
    click_on "New L Six/Fourth"

    fill_in "Abroad", with: @l_six_fourth.abroad
    fill_in "Abroad destination", with: @l_six_fourth.abroad_destination
    fill_in "Animal market", with: @l_six_fourth.animal_market
    fill_in "Animal market destination", with: @l_six_fourth.animal_market_destination
    fill_in "Contact pdp", with: @l_six_fourth.contact_pdp
    fill_in "Contact pdp destination", with: @l_six_fourth.contact_pdp_destination
    fill_in "Contact positive", with: @l_six_fourth.contact_positive
    fill_in "Contact positive destination", with: @l_six_fourth.contact_positive_destination
    fill_in "Explain of procedure alcohol", with: @l_six_fourth.explain_of_procedure_alcohol
    fill_in "Hospital", with: @l_six_fourth.hospital
    fill_in "Hospital destination", with: @l_six_fourth.hospital_destination
    check "Is gloves" if @l_six_fourth.is_gloves
    check "Is goggle" if @l_six_fourth.is_goggle
    check "Is gown" if @l_six_fourth.is_gown
    check "Is medic mask" if @l_six_fourth.is_medic_mask
    check "Is n95 ffp2" if @l_six_fourth.is_n95_ffp2
    check "Is n99 ffp3" if @l_six_fourth.is_n99_ffp3
    check "Is procedure" if @l_six_fourth.is_procedure
    check "Isn apd" if @l_six_fourth.isn_apd
    fill_in "L six first", with: @l_six_fourth.l_six_first_id
    fill_in "Medic officer", with: @l_six_fourth.medic_officer
    fill_in "Out town", with: @l_six_fourth.out_town
    fill_in "Out town destination", with: @l_six_fourth.out_town_destination
    click_on "Create Fourth"

    assert_text "Fourth was successfully created"
    click_on "Back"
  end

  test "updating a Fourth" do
    visit l_six_fourths_url
    click_on "Edit", match: :first

    fill_in "Abroad", with: @l_six_fourth.abroad
    fill_in "Abroad destination", with: @l_six_fourth.abroad_destination
    fill_in "Animal market", with: @l_six_fourth.animal_market
    fill_in "Animal market destination", with: @l_six_fourth.animal_market_destination
    fill_in "Contact pdp", with: @l_six_fourth.contact_pdp
    fill_in "Contact pdp destination", with: @l_six_fourth.contact_pdp_destination
    fill_in "Contact positive", with: @l_six_fourth.contact_positive
    fill_in "Contact positive destination", with: @l_six_fourth.contact_positive_destination
    fill_in "Explain of procedure alcohol", with: @l_six_fourth.explain_of_procedure_alcohol
    fill_in "Hospital", with: @l_six_fourth.hospital
    fill_in "Hospital destination", with: @l_six_fourth.hospital_destination
    check "Is gloves" if @l_six_fourth.is_gloves
    check "Is goggle" if @l_six_fourth.is_goggle
    check "Is gown" if @l_six_fourth.is_gown
    check "Is medic mask" if @l_six_fourth.is_medic_mask
    check "Is n95 ffp2" if @l_six_fourth.is_n95_ffp2
    check "Is n99 ffp3" if @l_six_fourth.is_n99_ffp3
    check "Is procedure" if @l_six_fourth.is_procedure
    check "Isn apd" if @l_six_fourth.isn_apd
    fill_in "L six first", with: @l_six_fourth.l_six_first_id
    fill_in "Medic officer", with: @l_six_fourth.medic_officer
    fill_in "Out town", with: @l_six_fourth.out_town
    fill_in "Out town destination", with: @l_six_fourth.out_town_destination
    click_on "Update Fourth"

    assert_text "Fourth was successfully updated"
    click_on "Back"
  end

  test "destroying a Fourth" do
    visit l_six_fourths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fourth was successfully destroyed"
  end
end
