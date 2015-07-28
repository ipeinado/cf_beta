class PromosController < ApplicationController

  before_action :find_promo, only: [:show, :edit, :update, :destroy]

	before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @promos = Promo.all
  end

  def show
  end

  def new
    @promo = Promo.new
  end

  def create
    @promo = Promo.new(promo_params)

    if @promo.save
      flash[:success] = I18n.t(:promo_successfully_created)
      redirect_to @promo
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @promo.update_attributes(promo_params)
      flash[:success] = I18n.t(:promo_successfully_updated)
      redirect_to @promo
    else
      render 'edit'
    end
  end

  def destroy
    @promo.destroy
    flash[:danger] = I18n.t(:promo_successfully_deleted)
    redirect_to promos_path
  end

  def find_promo
    @promo = Promo.find_by(params[:id])
  end

  private
    def promo_params
      params.require(:promo).permit(:promo_logo, :name, :brief_product_description, :long_product_description, :brief_promo_description, :website, :twitter, :facebook)
    end
end
