class ProfilesController < ApplicationController 
  
  def show 
    user = User.find(current_user.id)
    @profile = Profile.find_by(user_id: user.id)
  end 

end 