class WeeksController < ApplicationController
  def new 
    @id = params[:id]
  end 

  def create 
    workout = Workout.find(params[:id])
    workout.weeks.create_number_of_weeks(params[:num_weeks], workout)
    redirect_to "/workouts/#{workout.id}"
  end 

end 