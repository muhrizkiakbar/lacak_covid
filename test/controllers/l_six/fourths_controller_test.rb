require 'test_helper'

class LSix::FourthsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_six_fourth = l_six_fourths(:one)
  end

  test "should get index" do
    get l_six_fourths_url
    assert_response :success
  end

  test "should get new" do
    get new_l_six_fourth_url
    assert_response :success
  end

  test "should create l_six_fourth" do
    assert_difference('LSix::Fourth.count') do
      post l_six_fourths_url, params: { l_six_fourth: { abroad: @l_six_fourth.abroad, abroad_destination: @l_six_fourth.abroad_destination, animal_market: @l_six_fourth.animal_market, animal_market_destination: @l_six_fourth.animal_market_destination, contact_pdp: @l_six_fourth.contact_pdp, contact_pdp_destination: @l_six_fourth.contact_pdp_destination, contact_positive: @l_six_fourth.contact_positive, contact_positive_destination: @l_six_fourth.contact_positive_destination, explain_of_procedure_alcohol: @l_six_fourth.explain_of_procedure_alcohol, hospital: @l_six_fourth.hospital, hospital_destination: @l_six_fourth.hospital_destination, is_gloves: @l_six_fourth.is_gloves, is_goggle: @l_six_fourth.is_goggle, is_gown: @l_six_fourth.is_gown, is_medic_mask: @l_six_fourth.is_medic_mask, is_n95_ffp2: @l_six_fourth.is_n95_ffp2, is_n99_ffp3: @l_six_fourth.is_n99_ffp3, is_procedure: @l_six_fourth.is_procedure, isn_apd: @l_six_fourth.isn_apd, l_six_first_id: @l_six_fourth.l_six_first_id, medic_officer: @l_six_fourth.medic_officer, out_town: @l_six_fourth.out_town, out_town_destination: @l_six_fourth.out_town_destination } }
    end

    assert_redirected_to l_six_fourth_url(LSix::Fourth.last)
  end

  test "should show l_six_fourth" do
    get l_six_fourth_url(@l_six_fourth)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_six_fourth_url(@l_six_fourth)
    assert_response :success
  end

  test "should update l_six_fourth" do
    patch l_six_fourth_url(@l_six_fourth), params: { l_six_fourth: { abroad: @l_six_fourth.abroad, abroad_destination: @l_six_fourth.abroad_destination, animal_market: @l_six_fourth.animal_market, animal_market_destination: @l_six_fourth.animal_market_destination, contact_pdp: @l_six_fourth.contact_pdp, contact_pdp_destination: @l_six_fourth.contact_pdp_destination, contact_positive: @l_six_fourth.contact_positive, contact_positive_destination: @l_six_fourth.contact_positive_destination, explain_of_procedure_alcohol: @l_six_fourth.explain_of_procedure_alcohol, hospital: @l_six_fourth.hospital, hospital_destination: @l_six_fourth.hospital_destination, is_gloves: @l_six_fourth.is_gloves, is_goggle: @l_six_fourth.is_goggle, is_gown: @l_six_fourth.is_gown, is_medic_mask: @l_six_fourth.is_medic_mask, is_n95_ffp2: @l_six_fourth.is_n95_ffp2, is_n99_ffp3: @l_six_fourth.is_n99_ffp3, is_procedure: @l_six_fourth.is_procedure, isn_apd: @l_six_fourth.isn_apd, l_six_first_id: @l_six_fourth.l_six_first_id, medic_officer: @l_six_fourth.medic_officer, out_town: @l_six_fourth.out_town, out_town_destination: @l_six_fourth.out_town_destination } }
    assert_redirected_to l_six_fourth_url(@l_six_fourth)
  end

  test "should destroy l_six_fourth" do
    assert_difference('LSix::Fourth.count', -1) do
      delete l_six_fourth_url(@l_six_fourth)
    end

    assert_redirected_to l_six_fourths_url
  end
end
