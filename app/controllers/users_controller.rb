class UsersController < ApplicationController
  def update
    if current_user.update( user_params )
      redirect_to :root 
    else
      redirect_to :root 
    end
  end

  def edit
  end


  protected

  def user_params
    params.require(:user).permit(:avatar)
  end  
end
