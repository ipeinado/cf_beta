require 'test_helper'

class EntitiesControllerTest < ActionController::TestCase

  def setup
    @entity = entities(:closefunding)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @entity.id
    assert_response :success
  end

end
