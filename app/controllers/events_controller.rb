class EventsController < ApplicationController

  def index
    @events = Event.future_ordered.all
  end

  def show
    @event = Event.find(params[:id])
    @venue = Venue.find_by(id: @event.venue_id)
  end

end
