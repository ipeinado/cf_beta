require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
      @user = users(:michael)
  end

  test "login with invalid information" do
      #Visit the login path
      get login_path
      # Verify that the sessions path renders properly
      assert_template 'sessions/new'
      # Post to the sessions path with an invalid params hash
      post login_path, session: {email: "", password: ""}
      # Verify that the new sessions form get re-rendered and that the flash message appears
      assert_template 'sessions/new'
      assert_not flash.empty?
      # visit another page (such as the Home page)
      get root_path
      #Verify that the flash is empty
      assert flash.empty?, message: "flash in root page is not empty"
  end

  test "login with valid information" do
      # Visit the login path.
      get login_path
      assert_template 'sessions/new'
      # Post valid information to the sessions path.
      post login_path, session: { email: @user.email, password: 'password' }
      assert_redirected_to @user
      follow_redirect!
      assert_template 'users/show'
      # Verify that a logout link appears
      assert_select "a[href=?]", login_path, count: 0
      assert_select "a[href=?]", logout_path
      assert_select "a[href=?]", user_path(@user)
      # Verify that a profile link appears.

  end
end
