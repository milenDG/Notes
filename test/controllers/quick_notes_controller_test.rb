require 'test_helper'

class QuickNotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quick_note = quick_notes(:one)
  end

  test "should get index" do
    get quick_notes_url
    assert_response :success
  end

  test "should get new" do
    get new_quick_note_url
    assert_response :success
  end

  test "should create quick_note" do
    assert_difference('QuickNote.count') do
      post quick_notes_url, params: { quick_note: { content: @quick_note.content, subtitle: @quick_note.subtitle, title: @quick_note.title } }
    end

    assert_redirected_to quick_note_url(QuickNote.last)
  end

  test "should show quick_note" do
    get quick_note_url(@quick_note)
    assert_response :success
  end

  test "should get edit" do
    get edit_quick_note_url(@quick_note)
    assert_response :success
  end

  test "should update quick_note" do
    patch quick_note_url(@quick_note), params: { quick_note: { content: @quick_note.content, subtitle: @quick_note.subtitle, title: @quick_note.title } }
    assert_redirected_to quick_note_url(@quick_note)
  end

  test "should destroy quick_note" do
    assert_difference('QuickNote.count', -1) do
      delete quick_note_url(@quick_note)
    end

    assert_redirected_to quick_notes_url
  end
end
