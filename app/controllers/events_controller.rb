class EventsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @events = Event.future_ordered.all
  end

  def show
    @event = Event.find(params[:id])
    @venue = Venue.find_by(id: @event.venue_id)
  end

  def new
    @venue = Venue.find(params[:venue])
    @event = @venue.events.new(venue_id: @venue.id)
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:success] = I18n.t(:event_created_successfully)
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      redirect_to @event
      flash[:success] = I18n.t(:event_updated_successfully)
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy
    redirect_to events_path
    flash[:success] = I18n.t(:event_destroyed_successfully)

  end

  def tag
    @tag = params[:tag]
    @events = Event.tagged_with(@tag)
  end

  def event_params
    params.require(:event).permit(:venue_id, :event_header_picture, :event_header_picture_cache, :remove_event_header_picture, :title, :short_description, :long_description, :event_body_picture, :event_body_picture_cache, :remove_event_body_picture, :daytime, :tag_list, :organizer_ids => [], :user_ids => [], :entity_ids => [])
  end

end
