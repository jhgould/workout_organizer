class ProfilesController < ApplicationController 
  
  def show 
    user = User.find(current_user.id)
    @profile = Profile.find_by(user_id: user.id)
    if @profile.name == nil 
      redirect_to "/profile/edit"
    end 
  end 

  def edit 
  end 

  def update 
   user = User.find(current_user.id)
   profile = Profile.find_by(user_id: user.id)
   profile.update(profile_params)
   redirect_to '/profile'
  end 

private 

  def profile_params 
    params.permit(
      :name,
      :age,
      :height,
      :weight,
      :goal_weight
    )
  end 
end 