class StaticPagesController < ApplicationController
  def home
  	render layout: 'homepage'
  end

  def manifest
  end

  def findout
    @client_coordinates = Geocoder.coordinates(request.remote_ip) || [0, 0]
    @projects= Project.near(@client_coordinates, 250, :units => :km)
    if @projects.count(:all) == 0
      flash.now[:danger] = I18n.t(:nearby_projects, count: 0)
      @projects = Project.all
    else
      flash.now[:success] = I18n.t(:nearby_projects, count: @projects.count(:all))
    end

    respond_to do |format|
      format.html
      format.json { render json: get_geojson(@projects) }
    end
  end
end
