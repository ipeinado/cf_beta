require 'test_helper'

class VenuesControllerTest < ActionController::TestCase

  def setup
    @admin = users(:michael)
    @venue = venues(:spinosa)
    @venue.events.build(title: "Event 1",
                                 short_description: "Short description of Event 1",
                                 daytime: Time.zone.local(2016, 1, 10, 12))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end

  test "should get show" do
    get :show, id: @venue.id
    assert_response :success
    assert_not_nil assigns(:venue), message: "No venue instance variable sent from the controller"
  end

  test "venue show page shows future events" do
    @venue.save
    get :show, id: @venue.id
    assert_not_nil assigns(:future_venue_events)
  end

  test "venue show page shows past events" do
    @venue.save
    get :show, id: @venue.id
    assert_not_nil assigns(:past_venue_events)
  end

  test "only logged in users should have access to new" do
    get :new
    assert_redirected_to login_path
    assert_equal I18n.t(:user_not_logged_in), flash[:danger]
  end

  test "only logged in users have access to edit" do
    get :edit, id: @venue.id
    assert_redirected_to login_path
    assert_equal I18n.t(:user_not_logged_in), flash[:danger]
  end

  test "logged in users can create new venues" do
    log_in_as(@admin)
    get :new
    assert_response :success
    assert_select 'title', I18n.t(:new_venue) + " | Closefunding"
    assert_template layout: 'layouts/application', partial: '_form'
    assert_select 'h1', I18n.t(:new_venue)
    assert_difference('Venue.count', 1) do
      post :create, venue: {name: 'Guitar Club', city: 'Albacete', country: 'Spain'}
    end
    assert_redirected_to venue_path(assigns(:venue))
    assert_equal I18n.t(:venue_successfully_created), flash[:success]
  end

  test "logged in users can edit values" do
    log_in_as(@admin)
    get :edit, id: @venue.id
    assert_response :success
    assert_template layout: 'layouts/application', partial: '_form'
    patch :update, id: @venue, venue: {name: "Espinoso"}
    assert_redirected_to venue_path(assigns(:venue))
    assert_not flash.empty?
  end

  test "destroy venue destroy dependent events" do
    @venue.save
    assert_difference 'Venue.count', -1 do
      @venue.destroy
    end
  end
end
