class SessionsController < ApplicationController
  def new 
  end 

  def create 
    if @user = User.find_by(username: params[:username])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id 
        redirect_to '/home'
        profile = Profile.find_by(user_id: @user.id)
        # binding.pry
          if profile.name 
            flash[:notice] = "Welcome back #{profile.name}!"
          else  
            flash[:notice] = "Welcome to the Workout Organizer! Since you are new please update your profile information."
          end 
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
    flash[:success] = "You have succesfully logged out!"
  end 

end 