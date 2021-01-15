class WorkoutsController < ApplicationController 
  before_action :is_logged_in
  
  def index 
    @user = User.find(session[:user_id])
    # @workouts = Workout.all
  end 

  def show 
    @workout = Workout.find(params[:id])
  end 

  def new 
  end 

  def create 
    user = User.find(session[:user_id])
    Workout.create!(name: workout_params[:name], user: user )
    redirect_to "/workouts"
  end 

  def destroy 
    Workout.destroy(params[:id])
    redirect_to "/workouts"
  end 

  private 

  def workout_params 
   params.permit(:name, :user)
  end 
end 