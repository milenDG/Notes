require 'test_helper'

class NotebooksControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:one)
    @notebook = notebooks(:one)
  end

  test "should get index if logged" do
    get notebooks_url
    assert_template partial: '_notebook'
    assert_template layout: 'application'
    assert_response :success
  end

  test "should not get index if not logged" do
    sign_out users(:one)
    get notebooks_url
    assert_redirected_to new_user_session_url
  end

  test "should get new" do
    get new_notebook_url
    assert_response :success
  end

  test "should create notebook" do
    assert_difference('Notebook.count') do
      post notebooks_url, params: { notebook: { description: @notebook.description, subtitle: @notebook.subtitle, title: @notebook.title + " new" } }
    end

    assert_redirected_to notebook_url(Notebook.last)
  end

  test "should show notebook" do
    get notebook_url(@notebook)
    assert_template partial: '_notebook'
    assert_response :success
  end

  test "should get edit" do
    get edit_notebook_url(@notebook)
    assert_response :success
  end

  test "should update notebook" do
    patch notebook_url(@notebook), params: { notebook: { description: @notebook.description, subtitle: @notebook.subtitle, title: @notebook.title } }
    assert_redirected_to notebook_url(@notebook)
  end

  test "should destroy notebook" do
    assert_difference('Notebook.count', -1) do
      delete notebook_url(@notebook)
    end

    assert_redirected_to notebooks_url
  end

  test "should not show other user notebook" do
    get notebook_url(notebooks(:two))
    assert_response :missing
  end

  test "should not get edit other user notebook" do
    get edit_notebook_url(notebooks(:two))
    assert_response :missing
  end

  test "should not update other user notebook" do
    get edit_notebook_url(notebooks(:two))
    assert_response :missing
  end

end
