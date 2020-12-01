class SessionsController < ApplicationController
  def new 
  end 

  def create 
  
    if @user = User.find_by(username: params[:username])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to '/'
        flash[:notice] = "Welcome #{@user.username}, you have logged on to the workout organizer webpage"
      else 
        flash[:error] = "Credintials are bad"
        render :new
      end
    else 
      flash[:error] = "Credintials are bad"
      render :new
    end 
end 

  def destroy
    session.delete(:user_id)
    redirect_to '/'
    flash[:notice] = "You have succesfully logged out!"
  end 

end 