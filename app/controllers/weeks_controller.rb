class WeeksController < ApplicationController
  def new 
    @id = params[:id]
  end 

  def create 
    workout = Workout.find(params[:id])
    workout.weeks.create_number_of_weeks(params[:num_weeks], workout)
    workout.weeks.create_days_for_week(workout.weeks) 

    redirect_to "/workouts/#{workout.id}"
  end 

  def show 
    @week = Week.find(params[:id])
  end 

  def destroy 
    workout = Week.find(params[:id])
    Week.destroy(params[:id])
    redirect_to "/workouts/#{workout[:workout_id]}"
  end 

end 