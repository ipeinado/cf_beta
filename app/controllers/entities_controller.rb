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
  end

  def update
  end

  def destroy
  end

  private
    def entity_params
      params.require(:entity).permit(:name, :entity_logo, :city, :bio, :twitter, :facebook, :website)
    end
end
