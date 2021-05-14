require 'pry'
class PhotosController < ApplicationController
    before_action :redirect_if_not_logged_in, except: [:index, :show]

    def index
        @photos = Photo.all
    end

    def new
        @photo = Photo.new
        @photo.build_restaurant
    end

    def create
        # @photo = current_user.photos.build(photo_params)

        @photo = Photo.new(photo_params)

        if @photo.save
            redirect_to photo_path(@photo)
        else
            render :new
        end
    end

    def show
        @photo = Photo.find_by(id: params[:id])
    end

    private

    # We add user_id to strong params so it creates proper associations regardless of whether or not we're using
    # nested resources. It reduces the amount of code needed by including it here.

    def photo_params
        params.require(:photo).permit(:url, :description, :rating, :user_id, :restaurant_id, restaurant_attributes: [:name, :logo])
    end
end
