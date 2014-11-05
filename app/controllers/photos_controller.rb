class PhotosController < ApplicationController

  before_action :set_my_photo, :only => [:edit, :update, :destroy]


  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      redirect_to :root
    else
      render :root
    end
  end

  def edit

  end

  def update
    if @photo.update(photo_params)
      redirect_to photos_path
    else
      render :action => :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  def index
    if current_user
      @photos = current_user.photos
    else
      redirect_to :root
    end
  end

  protected

  def set_my_photo
    @photo = current_user.photos.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:img, :title)
  end 

end
