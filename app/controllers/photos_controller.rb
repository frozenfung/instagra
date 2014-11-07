class PhotosController < ApplicationController

  before_action :set_photo, :only => [:destroy]

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @photo.save

    redirect_to :root
  end

  def index
    @photos = current_user.photos.includes(:comments) if current_user
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  protected

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:description, :img)
  end

end
