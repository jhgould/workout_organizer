class SessionsController < ApplicationController
  def new 
  end 

  def create 
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id 
      # flash[:notice] = "Welcome, #{@user.username}!"
      redirect_to '/'
    else 
      # flash[:error] = "Credintials are bad"
      render :new
    end 
  end 

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end 

end 