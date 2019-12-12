require 'test_helper'

class NotebookTest < ActiveSupport::TestCase
  test 'valid notebook' do
    notebook = Notebook.new(title: 'Title', subtitle: 'Subtitle', description: 'Test description', user: User.first)
    assert notebook.valid?
  end

  test 'valid notebook without subtitle' do
      notebook = Notebook.new(title: 'Title', description: 'Test description', user: User.first)
      assert notebook.valid?
  end

  test 'invalid notebook without title' do
      notebook = Notebook.new(subtitle: 'Subtitle', description: 'Test description', user: User.first)
      refute notebook.valid?, 'notebook is not valid without a title'
      assert_not_nil notebook.errors[:title]
  end

  test 'invalid notebook without description' do
      notebook = Notebook.new(title: 'Title', subtitle: 'Subtitle', user: User.first)
      refute notebook.valid?, 'notebook is not valid without description'
      assert_not_nil notebook.errors[:description]
  end

  test 'invalid notebook without user' do
      notebook = Notebook.new(title: 'Title', description: 'Subtitle', description: 'Test description')
      refute notebook.valid?, 'notebook is not valid without description'
      assert_not_nil notebook.errors[:user]
  end
end
