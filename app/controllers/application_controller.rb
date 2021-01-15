class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :error, :success, :notice
  helper_method :current_user, :is_logged_in
   

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  def is_logged_in 
    if current_user == nil 
      render file: "/public/404"
    end 
  end 

end
