class UsersController < ApplicationController
  def new 
  end 

  def create 
    User.create(user_params)
    redirect_to "/"
  end 


  private 
  def user_params
    params.permit(:username, :password)
  end 
end 