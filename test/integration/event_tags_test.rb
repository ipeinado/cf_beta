require 'test_helper'

class EventTagsTest < ActionDispatch::IntegrationTest

  def setup
    @venue = venues(:spinosa)
    @event1 = events(:cf_onehour)
    @event2 = events(:cf_onemonth)
    @event3 = events(:cf_oneyear)

    @event1.tag_list.add("closefunding")
    @event3.tag_list.add("closefunding")
  end

  test "events page has 3 events" do
    get events_path
    assert_response :success
    assert assigns(:events)
    assert_select 'li.event', count: 3
  end
  
end
