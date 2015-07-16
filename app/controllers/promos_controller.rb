class PromosController < ApplicationController

	before_action :logged_in_user, only: [:new, :create, :update, :destroy]
  before_action :admin_user, only: [:new, :create, :update, :destroy]

  def index
    @promos = Promo.all
  end

  def new
  end
end
