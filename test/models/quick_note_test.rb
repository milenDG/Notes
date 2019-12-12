require 'test_helper'

class QuickNoteTest < ActiveSupport::TestCase
  test 'valid quick_note' do
    quick_note = QuickNote.new(title: 'Title of Test QuickNote', subtitle: 'Subtitle', content: 'Test Content', user: User.first)
    assert quick_note.valid?
  end

  test 'valid quick_note without subtitle' do
    quick_note = QuickNote.new(title: 'Title of Test QuickNote', content: 'Test Content', user: User.first)
    assert quick_note.valid?
  end

  test 'invalid quick_note without title' do
    quick_note = QuickNote.new(subtitle: 'Subtitle', content: 'Test Content', user: User.first)
    refute quick_note.valid?, 'quick_note is not valid without a title'
    assert_not_nil quick_note.errors[:title]
   end

  test 'invalid quick_note without content' do
    quick_note = QuickNote.new(title: 'Title', subtitle: 'Subtitle', user: User.first)
    refute quick_note.valid?, 'quick_note is not valid without content'
    assert_not_nil quick_note.errors[:content]
  end

  test 'invalid quick_note without user' do
    quick_note = QuickNote.new(title: 'Title', subtitle: 'Subtitle', content: 'Test Content')
    refute quick_note.valid?, 'quick_note is not valid without content'
    assert_not_nil quick_note.errors[:user]
  end
end
