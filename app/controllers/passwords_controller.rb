class PasswordsController < ApplicationController 
  before_action :is_logged_in
  
  def edit 
  end 

  def update
    user = current_user
    user.update!(password: params[:password])
    redirect_to '/profile'
  end 


  private
  def password_params
    params.permit(:password)
  end
 
end 
