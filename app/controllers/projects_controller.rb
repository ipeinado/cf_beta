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
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
        flash[:success] = I18n.t(:flash_update_project_success)
        redirect_to @project
      else
        render 'edit'
      end
  end

  def destroy
    @project = Project.find(params[:id])
    flash[:danger] = I18n.t(:project_destroyed, name: @project.title)
    @project.destroy
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:title, :description, :address, :city, :province, :country, :logo, :website, :twitter, :featured_picture)
    end

end
