require 'test_helper'

class PromosControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promos), message: "index does not pass instance variable with promos"
  end

  test "new should be in admin" do
    log_in_as(@user)
    get :new
    assert_routing '/admin/promos/new', controller: 'promos', action: 'new'
  end
end
