require 'test_helper'

class AppointmentNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment_note = appointment_notes(:one)
  end

  test "should get index" do
    get appointment_notes_url, as: :json
    assert_response :success
  end

  test "should create appointment_note" do
    assert_difference('AppointmentNote.count') do
      post appointment_notes_url, params: { appointment_note: { notes: @appointment_note.notes, practitioner_id: @appointment_note.practitioner_id, user_id: @appointment_note.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show appointment_note" do
    get appointment_note_url(@appointment_note), as: :json
    assert_response :success
  end

  test "should update appointment_note" do
    patch appointment_note_url(@appointment_note), params: { appointment_note: { notes: @appointment_note.notes, practitioner_id: @appointment_note.practitioner_id, user_id: @appointment_note.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy appointment_note" do
    assert_difference('AppointmentNote.count', -1) do
      delete appointment_note_url(@appointment_note), as: :json
    end

    assert_response 204
  end
end
