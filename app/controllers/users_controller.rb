class UsersController < ApplicationController
  def new 
  end 

  def create 
    new_user = User.create(user_params)
    # flash[:success] = "Welcome, #{new_user.username}"    
    redirect_to "/users/#{new_user[:id]}"
  end 

  def show 
    @user = User.find(params[:id])
  end 


  private
    def user_params
      params.permit(:username, :password)
    end
end  