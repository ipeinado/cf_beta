class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @geoJson = self.get_geojson

    respond_to do |format|
      format.html
      format.json { render json: @geoJson }
    end
  end
  
end
