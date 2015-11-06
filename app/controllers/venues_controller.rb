class VenuesController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      redirect_to @venue
      flash[:success] = I18n.t(:venue_successfully_created)
    else
      render 'new'
    end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])

    if @venue.update_attributes(venue_params)
      redirect_to @venue
      flash[:success] = I18n.t(:venue_successfully_updated)
    else
      render 'edit'
    end
  end

  def destroy
    @venue = Venue.find(params[:id])

    @venue.destroy
    redirect_to venues_path
    flash[:success] = I18n.t(:venue_successfully_deleted)

  end

  private
    def venue_params
      params.require(:venue).permit(:name, :venue_picture, :city, :province, :country, :phone, :website, :twitter, :facebook, :accessibility)
    end
end
