require 'pry'
class PhotosController < ApplicationController
    before_action :redirect_if_not_logged_in, except: [:index, :show]
    before_action :get_photo, except: [:index, :new, :create]

    def index
        if params[:restaurant_id]
            @restaurant = Restaurant.find_by(id: params[:restaurant_id])
            @photos = @restaurant.photos
        else
            @photos = Photo.all
        end
    end

    def new
        if params[:restaurant_id]
            @restaurant = Restaurant.find_by(id: params[:restaurant_id])
            @photo = @restaurant.photos.build
        else
            @photo = Photo.new
            @photo.build_restaurant
        end
    end

    def create
        if params[:restaurant_id]
            @restaurant = Restaurant.find_by(id: params[:restaurant_id])
            @photo = @restaurant.photos.build(photo_params)
        else    
            @photo = Photo.new(photo_params)
        end

        if @photo.save
            redirect_to photo_path(@photo)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @photo.update(photo_params)
            redirect_to photo_path(@photo)
        else
            render :edit
        end
    end

    private

    # We add user_id to strong params so it creates proper associations regardless of whether or not we're using
    # nested resources. It reduces the amount of code needed by including it here.

    def photo_params
        params.require(:photo).permit(:url, :description, :rating, :user_id, :restaurant_id, restaurant_attributes: [:name, :logo])
    end

    def get_photo
        @photo = Photo.find_by(id: params[:id])
    end
end
