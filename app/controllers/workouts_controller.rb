class WorkoutsController < ApplicationController 
  def index 
    @workouts = Workout.all
  end 

  def show 
    @workout = Workout.find(params[:id])
  end 

  def new 
  end 

  def create 
    Workout.create(workout_params)
    redirect_to "/workouts"
  end 

  def destroy 
    Workout.destroy(params[:id])
    redirect_to "/workouts"
  end 

  private 

  def workout_params 
   params.permit(:name)
  end 
end 