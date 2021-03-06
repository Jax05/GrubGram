class RestaurantsController < ApplicationController
  before_action :redirect_if_not_logged_in, except: [:index, :show]
  
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :logo)
  end
end
