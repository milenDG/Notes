require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @notebook = notebooks(:one)
  end

  test "should get contacts index if logged" do
    get contacts_index_url
    assert_template layout: 'application'
    assert_response :success
  end

  test "should not get contacts index if not logged" do
    sign_out users(:one)
    get contacts_index_url
    assert_redirected_to new_user_session_url
  end

  test "should have user values prefilled" do
    get contacts_index_url
    assert_select "h1", "Contacts"
    assert_select "#name" do
      assert_select "[value=?]", users(:one).name
    end
    assert_select "#email" do
      assert_select "[value=?]", users(:one).email
    end
  end

end
