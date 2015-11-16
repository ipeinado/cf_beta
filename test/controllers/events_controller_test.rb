require 'test_helper'

class EventsControllerTest < ActionController::TestCase

  def setup
    @venue = venues(:spinosa)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @venue.events.first.id
    assert_response :success
  end

end
