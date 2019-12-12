require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:one)
    @note = notes(:one)
  end

  test "should get index if logged" do
    get notes_url
    assert_template partial: '_note'
    assert_template layout: 'application'
    assert_response :success
  end

  test "should not get index if not logged" do
    sign_out users(:one)
    get notes_url
    assert_redirected_to new_user_session_url
  end

  test "should get new" do
    get new_note_url
    assert_response :success
  end

  test "should create note" do
    assert_difference('Note.count') do
      post notes_url, params: { note: { content: @note.content, subtitle: @note.subtitle, title: @note.title + " new" , notebook_id: @note.notebook_id } }
    end

    assert_redirected_to note_url(Note.last)
  end

  test "should show note" do
    get note_url(@note)
    assert_template partial: '_note'
    assert_response :success
  end

  test "should get edit" do
    get edit_note_url(@note)
    assert_response :success
  end

  test "should update note" do
    patch note_url(@note), params: { note: { content: @note.content, subtitle: @note.subtitle, title: @note.title } }
    assert_redirected_to note_url(@note)
  end

  test "should destroy note" do
    assert_difference('Note.count', -1) do
      delete note_url(@note)
    end

    assert_redirected_to notes_url
  end

  test "should not show other user note" do
    get note_url(notes(:two))
    assert_response :missing
  end

  test "should not get edit other user note" do
    get edit_note_url(notes(:two))
    assert_response :missing
  end

  test "should not update other user note" do
    get edit_note_url(notes(:two))
    assert_response :missing
  end

  test "should have update values prefilled" do
    get edit_note_url(@note)
    assert_select "h1", "Editing Note"

    assert_select "#note_title" do
      assert_select "[value=?]", @note.title
    end

    assert_select "#note_subtitle" do
      assert_select "[value=?]", @note.subtitle
    end

    assert_select "#note_content", @note.content
  end

end
