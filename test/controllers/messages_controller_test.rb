require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  test "should get manifest_support" do
    get :manifest_support
    assert_response :success
  end

end
