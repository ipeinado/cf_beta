class StaticPagesController < ApplicationController
  def home
  	render layout: 'homepage'
  end

  def manifest
  end
end
