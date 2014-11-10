class UsersController < ApplicationController

  before_action :set_user, :only => [:show]

  def show
    @photos = @user.created_photos.order("created_at DESC")
  end

  private


  def set_user
    @user = User.find(params[:id])
  end

  def params_user
    params.require(:user).permit(:id)
  end

end
