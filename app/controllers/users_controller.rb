class UsersController < ApplicationController
  def new 
  end 

  def create 
    new_user = User.create(user_params)
    flash[:success] = "Welcome, #{new_user.username}"    
    redirect_to "/"
  end 


  private
    def user_params
      params.permit(:username, :password)
    end
end  