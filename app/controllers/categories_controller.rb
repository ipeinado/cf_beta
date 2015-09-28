class CategoriesController < ApplicationController

  def index
    @categories = Category.all

    respond_to do |format|
      format.json { render :json => @categories.to_json(:only => [:name])}
    end

  end

  def show
    @category = Category.find(params[:id])
    @promos = @category.promos.all
  end
end
