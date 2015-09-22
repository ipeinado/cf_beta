class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @promos = @category.promos.all
  end
end
