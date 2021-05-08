class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def create
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end
end
