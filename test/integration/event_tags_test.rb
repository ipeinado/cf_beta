require 'test_helper'

class EventTagsTest < ActionDispatch::IntegrationTest

  def setup
    @venue = venues(:spinosa)
    @event1 = events(:cf_onehour)
    @event2 = events(:cf_onemonth)
    @event3 = events(:cf_oneyear)

    @event1.tag_list.add("closefunding", "coworking")
    @event1.save
    @event2.tag_list.add("business", "coworking")
    @event2.save
    @event3.tag_list.add("closefunding", "business")
    @event3.save
  end

  test "events page has 3 events" do
    get events_path
    assert_response :success
    assert assigns(:events)
    assert_select 'li.event', count: 3
  end

  test "related events appear in show event" do
    get event_path(id: @event1.id)
    assert_response :success
    assert assigns(:related_events)
    assert_select 'li.event', count: 2
  end

end
