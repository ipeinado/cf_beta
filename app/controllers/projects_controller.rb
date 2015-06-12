class ProjectsController < ApplicationController

  before_action :logged_in_user, only: [:new, :create, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :update, :destroy]

  def index
    @projects = Project.all
    @geoJson = self.get_geojson

    respond_to do |format|
      format.html
      format.json { render json: @geoJson }
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:success] = I18n.t(:flash_create_project_success)
      redirect_to @project
    else
      render(:new)
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    if @project.update_attributes(user_params)
        flash[:success] = I18n.t(:flash_update_project_success)
        redirect_to @project
      else
        render 'edit'
      end
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :address, :city, :province, :country, :logo, :website, :twitter)
    end

end
