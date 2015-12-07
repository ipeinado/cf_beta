require 'test_helper'

class PromosControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = users(:michael)
    @balsamiq = promos(:balsamiq)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promos), message: "index does not pass instance variable with promos"
  end

  test "should not have access to promo#new if user not logged in" do
    get :new
    assert_equal I18n.t(:user_not_logged_in), flash[:danger]
    assert_redirected_to login_path
  end

  test "new should be in admin" do
    log_in_as(@user)
    get :new
    assert_select 'title', "#{I18n.t(:new_promo)} | Closefunding"
    assert_select 'ul.nav-tabs' do
      assert_select 'li.active', Promo.model_name.human(count: 2)
    end
    assert_select 'h1', I18n.t(:new_promo)
    assert_select 'form'
  end
end
