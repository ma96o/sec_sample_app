require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
  end

  test "invalid signup information" do
    get signup_path
    assert_no_difference "User.count" do
      post users_path, params: { user: { name: "",
                                  email: "user@invalid",
                                  password: "foo",
                                  password_confirmation: "bar"
                                  } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Example User",
                                    email: "user@example.com",
                                    password: "password",
                                    password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash.empty?
    assert_select "div.alert-success"
    assert is_logged_in?
  end

  test 'authenticated? should return false for a user with nil digest' do
    assert_not @user.authenticated?("")
  end
end
