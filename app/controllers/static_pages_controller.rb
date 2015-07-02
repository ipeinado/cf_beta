class StaticPagesController < ApplicationController
  def home
  	render layout: 'homepage'
  end

  def manifest
  end

  def findout
    @client_coordinates = Geocoder.coordinates(request.remote_ip)
    @projects= Project.near(@client_coordinates, 100, :units => :km)
    if @client_coordinates.nil? || @projects.count(:all) == 0
      flash.now[:danger] = I18n.t(:nearby_projects, count: 0)
      @client_coordinates = [37.741, -0.857]
      @projects = Project.all
    else
      flash.now[:success] = I18n.t(:nearby_projects, count: @projects.count(:all))
    end
    
    @geoJson_nearby_projects = get_geojson(@projects)

    respond_to do |format|
      format.html
      format.json { render json: @geoJson_nearby_projects }
    end
  end
end
