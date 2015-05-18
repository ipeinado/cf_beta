require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
  	@user = users(:michael)
  	@other_user = users(:archer)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect index when not logged in" do
  	get :index
  	assert_redirected_to login_url
  end

  test "should redirect edit when user not logged in" do
  	get :edit, id: @user
  	assert_not flash.empty?
  	assert_redirected_to login_url
  end

  test "should redirect to update when user not logged in" do
  	get :update, id: @user, user: { name: @user.name, email: @user.email }
  	assert_not flash.empty?
  	assert_redirected_to login_url
  end

  test "should redirect to root when logged in as other user" do
  	log_in_as(@other_user)
  	get :edit, id: @user
  	assert_not flash.empty?, message: "No flash in da house"
  	assert_redirected_to root_path
  end

end
