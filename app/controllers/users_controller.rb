class UsersController < ApplicationController

  before_action :set_user, :only => [:add_friend, :cancel_friend, :ignore_friend, :confirm_friend]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.created_photos.order("created_at DESC")
  end



  def add_friend
    if current_user.find_ship(@user).nil?
      f1 = current_user.friendships.new 
      f1.friend = @user
      f1.founder = current_user.id
      f1.save

      f2 = @user.friendships.new
      f2.friend = current_user
      f2.founder = current_user.id
      f2.save
    end

    redirect_to users_path
  end

  def cancel_friend
    f1 = current_user.find_ship(@user)
    f2 = @user.find_ship(current_user)
    f1.destroy
    f2.destroy

    redirect_to users_path
  end

  def ignore_friend
    f1 = current_user.find_ship(@user)
    f1.checked = true
    f2 = @user.find_ship(current_user)
    f2.checked = true

    f1.save
    f2.save

    redirect_to users_path
  end

  def confirm_friend
    f1 = current_user.find_ship(@user)
    f1.status = 'friend'
    f2 = @user.find_ship(current_user)
    f2.status = 'friend'
    f1.save
    f2.save

    redirect_to users_path
  end


  private


  def set_user
    @user = User.find(params[:user_id])
  end

  def params_user
    params.require(:user).permit(:id)
  end
end
