class PhotosController < ApplicationController


before_action :check_login

before_action :set_photo, :only => [:destroy, :like, :unlike, :subscribe, :unsubscribe]




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
    @photo.destroy
    redirect_to photos_path
  end


  def like
    like = Like.new
    like.user = current_user
    like.photo = @photo
    like.liked = true
    like.save
    redirect_to :root
  end

  def unlike
    @like = Like.where(:photo_id => @photo.id, :user_id => current_user.id)
    @like.destroy_all
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
    params.require(:photo).permit(:description, :img)
  end


end
