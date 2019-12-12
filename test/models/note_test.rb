require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  test 'valid note' do
    note = Note.new(title: 'Title', subtitle: 'Subtitle', content: 'Test Content', notebook: Notebook.first)
    assert note.valid?
  end

  test 'valid note without subtitle' do
    note = Note.new(title: 'Title',content: 'Test Content', notebook: Notebook.first)
    assert note.valid?
  end

  test 'invalid note without title' do
    note = Note.new(subtitle: 'Subtitle', content: 'Test Content', notebook: Notebook.first)
    refute note.valid?, 'note is not valid without a title'
    assert_not_nil note.errors[:title]
  end

  test 'invalid note without content' do
    note = Note.new(title: 'Title', subtitle: 'Subtitle', notebook: Notebook.first)
    refute note.valid?, 'note is not valid without content'
    assert_not_nil note.errors[:content]
  end

  test 'invalid note without notebook' do
    note = Note.new(title: 'Title', subtitle: 'Subtitle', content: 'Test Content')
    refute note.valid?, 'note is not valid without content'
    assert_not_nil note.errors[:notebook]
  end
end
