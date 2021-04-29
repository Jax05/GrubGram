class PhotosController < ApplicationController
    def index
        @photos = Photo.all
    end

    def new
        @photo = Photo.new
    end

    def create
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

    def photo_params
        params.require(:photo).permit(:url, :description, :rating)
    end
end
