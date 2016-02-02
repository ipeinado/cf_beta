class EntitiesController < ApplicationController

  before_action :logged_in_user, except: [:index, :show]
  before_action :admin_user, except: [:index, :show]

  def index
    @entities = Entity.all
  end

  def show
    @entity = Entity.find(params[:id])
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.create(entity_params)

    if @entity.save
      redirect_to @entity
      flash[:success] = I18n.t(:entity_created_successfully)
    else
      render(:new)
    end
  end

  def edit
    @entity = Entity.find(params[:id])
  end

  def update
    @entity = Entity.find(params[:id])

    if @entity.update_attributes(entity_params)
      flash[:success] = I18n.t(:entity_successfully_updated)
      redirect_to @entity
    else
      render(:edit)
    end

  end

  def destroy
    @entity = Entity.find(params[:id])
    flash[:success] = I18n.t(:entity_successfully_deleted)
    @entity.destroy
    redirect_to entities_path
  end

  private
    def entity_params
      params.require(:entity).permit(:name, :entity_logo, :entity_logo_cache, :remove_entity_logo, :city, :bio, :twitter, :facebook, :website)
    end
end
