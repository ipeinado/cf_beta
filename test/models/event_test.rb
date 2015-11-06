require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @venue = venues(:spinosa)
    @event = @venue.events.build(title: "Encuentro Closfunding",
                                               short_description: "Closefunders are welcome!",
                                               daytime: Date.today + 1)
  end

  test "event should be valid" do
    assert @event.valid?
  end

  test "event should have a title" do
    @event.title = ""
    assert_not @event.valid?
  end

  test "event should have a short description" do
    @event.short_description = ""
    assert_not @event.valid?
  end

  test "short description should not be longer than 255 characters" do
    @event.short_description = "a" * 256
    assert_not @event.valid?
  end

  test "daytime should be present" do
    event_no_date = @venue.events.build(title: "Unannounced event", short_description: "We are having a secret event")
    assert_not event_no_date.valid?
  end

  test "future events should only display future events" do
    assert_equal Event.future.count, 3
  end

  test "future events should be ordered by ascending date" do
    assert_equal events(:cf_onehour), Event.future_ordered.first
  end

  test "past events should only display past events" do
    assert_equal Event.past.count, 2
  end

  test "past events should be order by descending date" do
    assert_equal events(:cf_five_days_ago), Event.past_ordered.first
  end

end
