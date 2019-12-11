require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest

  test "should get contacts index if logged" do
    sign_in users(:one)
    get contacts_index_url
    assert_template layout: 'application'
    assert_response :success
  end

  test "should not get contacts index if not logged" do
    sign_out users(:one)
    get contacts_index_url
    assert_redirected_to new_user_session_url
  end

end
