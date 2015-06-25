class StaticPagesController < ApplicationController
  def home
  	render layout: 'homepage'
  end

  def manifest
  end

  def findout
    @projects= Project.near(Geocoder.coordinates(request.remote_ip), 0, :units => :km)
    if @projects.count(:all) == 0
      flash[:danger] = "Ooops! No hay proyectos cerca de ti"
      @projects = Project.all
    end
    @geoJson_nearby_projects = get_geojson(@projects)
  end
end
