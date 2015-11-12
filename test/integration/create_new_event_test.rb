require 'test_helper'

class CreateNewEventTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    @venue = venues(:spinosa)
  end

  test "create new event" do
    log_in_as(@user)
    @venue.save
    get venue_path(@venue.id)
    assert_response :success
    # The controller sends an instance variable with the venue
    assert_not_nil assigns(:venue)

    # The venue has a new event button if user is logged in
    assert_select 'a#new-event-btn'

    get_via_redirect new_event_path, venue: @venue.id
    assert_equal '/events/new', path
    assert_select 'title', I18n.t(:new_event) + " | Closefunding"

    assert_template partial: 'events/_form'

    post_via_redirect '/events', event: { venue_id: @venue.id, title: "Example event", short_description: "Short description of the event", daytime: Time.zone.local(2016, 1, 1, 10)}
    assert_template 'events/show'
  end

end
