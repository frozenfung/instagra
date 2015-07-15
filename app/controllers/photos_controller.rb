class PhotosController < ApplicationController

  before_action :check_login
  before_action :set_photo, :only => [:like, :unlike, :subscribe, :unsubscribe]

  autocomplete :tag, :name

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    @photo.save

    redirect_to :root
  end

  def index
    @photos = current_user.photos.order("created_at DESC").includes(:comments) if current_user
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to root_path
  end

  def like
    unless current_user.like_this_photo?(@photo)
      like = current_user.likes.new
      like.photo = @photo
      # like.liked = true
      like.save
    end
    redirect_to :root
  end

  def unlike
    @like = current_user.find_photo_like(@photo)
    @like.destroy

    redirect_to :root
  end

  def subscribe
    subscribe = Subscribe.new
    subscribe.user = current_user
    subscribe.photo = @photo
    subscribe.subscribed = true
    subscribe.save

    redirect_to :root
  end

  def unsubscribe
    @subscribe = Subscribe.where(:photo_id => @photo.id, :user_id => current_user.id)
    @subscribe.destroy_all
    redirect_to :root
  end


  protected

  def check_login
    redirect_to :root unless current_user
  end


  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  def photo_params
    params.require(:photo).permit(:description, :img, :tag_name)
  end


end
