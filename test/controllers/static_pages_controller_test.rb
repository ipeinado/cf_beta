require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
      @title_brand = "Closefunding"
  end

  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Bienvenido | #{@title_brand}"
  end

  test "should get manifest" do
    get :manifest
    assert_response :success
    assert_select "title", "Manifiesto | #{@title_brand}"
  end

end
