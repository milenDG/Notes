require "application_system_test_case"

class QuickNotesTest < ApplicationSystemTestCase
  setup do
    @quick_note = quick_notes(:one)
  end

  test "visiting the index" do
    visit quick_notes_url
    assert_selector "h1", text: "Quick Notes"
  end

  test "creating a Quick note" do
    visit quick_notes_url
    click_on "New Quick Note"

    fill_in "Content", with: @quick_note.content
    fill_in "Subtitle", with: @quick_note.subtitle
    fill_in "Title", with: @quick_note.title
    click_on "Create Quick note"

    assert_text "Quick note was successfully created"
    click_on "Back"
  end

  test "updating a Quick note" do
    visit quick_notes_url
    click_on "Edit", match: :first

    fill_in "Content", with: @quick_note.content
    fill_in "Subtitle", with: @quick_note.subtitle
    fill_in "Title", with: @quick_note.title
    click_on "Update Quick note"

    assert_text "Quick note was successfully updated"
    click_on "Back"
  end

  test "destroying a Quick note" do
    visit quick_notes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Quick note was successfully destroyed"
  end
end
