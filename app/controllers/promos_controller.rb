class PromosController < ApplicationController

  def index
    @promos = Promo.all
  end

  def new
  end
end
