require 'test_helper'

class LampiranEleven::SpecimenContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @lampiran_eleven_specimen_contact = lampiran_eleven_specimen_contacts(:one)
  end

  test "should get index" do
    get lampiran_eleven_specimen_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_lampiran_eleven_specimen_contact_url
    assert_response :success
  end

  test "should create lampiran_eleven_specimen_contact" do
    assert_difference('LampiranEleven::SpecimenContact.count') do
      post lampiran_eleven_specimen_contacts_url, params: { lampiran_eleven_specimen_contact: { date_of_specimen_collection: @lampiran_eleven_specimen_contact.date_of_specimen_collection, laboratory_examination_results: @lampiran_eleven_specimen_contact.laboratory_examination_results, lampiran_eleven_close_contact_information_id: @lampiran_eleven_specimen_contact.lampiran_eleven_close_contact_information_id, type_of_specimen: @lampiran_eleven_specimen_contact.type_of_specimen } }
    end

    assert_redirected_to lampiran_eleven_specimen_contact_url(LampiranEleven::SpecimenContact.last)
  end

  test "should show lampiran_eleven_specimen_contact" do
    get lampiran_eleven_specimen_contact_url(@lampiran_eleven_specimen_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_lampiran_eleven_specimen_contact_url(@lampiran_eleven_specimen_contact)
    assert_response :success
  end

  test "should update lampiran_eleven_specimen_contact" do
    patch lampiran_eleven_specimen_contact_url(@lampiran_eleven_specimen_contact), params: { lampiran_eleven_specimen_contact: { date_of_specimen_collection: @lampiran_eleven_specimen_contact.date_of_specimen_collection, laboratory_examination_results: @lampiran_eleven_specimen_contact.laboratory_examination_results, lampiran_eleven_close_contact_information_id: @lampiran_eleven_specimen_contact.lampiran_eleven_close_contact_information_id, type_of_specimen: @lampiran_eleven_specimen_contact.type_of_specimen } }
    assert_redirected_to lampiran_eleven_specimen_contact_url(@lampiran_eleven_specimen_contact)
  end

  test "should destroy lampiran_eleven_specimen_contact" do
    assert_difference('LampiranEleven::SpecimenContact.count', -1) do
      delete lampiran_eleven_specimen_contact_url(@lampiran_eleven_specimen_contact)
    end

    assert_redirected_to lampiran_eleven_specimen_contacts_url
  end
end
