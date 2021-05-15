class PhotosController < ApplicationController
    before_action :redirect_if_not_logged_in, except: [:index, :show]
    before_action :get_photo, except: [:index, :new, :create]

    def index
        if restaurant_present_and_set
            @photos = @restaurant.photos
        else
            @photos = Photo.all
        end
    end

    def new
        if restaurant_present_and_set
            @photo = @restaurant.photos.build
        else
            @photo = Photo.new
            @photo.build_restaurant
        end
    end

    def create
        if restaurant_present_and_set
            @photo = @restaurant.photos.build(photo_params)
            @photo.user = current_user
        else    
            @photo = current_user.photos.build(photo_params)
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

    def destroy
        @photo.destroy
        redirect_to photos_path
    end

    private

    def photo_params
        params.require(:photo).permit(:url, :description, :rating, :restaurant_id, restaurant_attributes: [:name, :logo])
    end

    def get_photo
        @photo = Photo.find_by(id: params[:id])
    end

    def restaurant_present_and_set
        params[:restaurant_id] && @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    end

end
