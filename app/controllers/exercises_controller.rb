class ExercisesController < ApplicationController 
  before_action :is_logged_in
  def new 
    @id = params[:id]
  end 

  def create 
    day = Day.find(params[:id])
    Exercise.create!(category: params[:category], muscle_group: params[:muscle_group], name: params[:name], sets: params[:sets], reps: params[:reps], weight: params[:weight], rest_time: params[:rest_time], day: day)
    redirect_to "/days/#{day.id}"
  end 

  def destroy 
    Exercise.destroy(params[:id])
    redirect_to "/days/#{params[:day_id]}"
  end 

  def edit
    @exercise = Exercise.find(params[:id])
  end 

  def update
    exercise = Exercise.find(params[:id]) 
    exercise.update!(category: params[:category], muscle_group: params[:muscle_group], name: params[:name], sets: params[:sets], reps: params[:reps], weight: params[:weight], rest_time: params[:rest_time])
    exercise.save!
    redirect_to "/days/#{exercise.day_id}"
  end 

private 

# def exercise_params
#   params.permit("category",
#                 "muscle_group",
#                 :name, 
#                 :sets, 
#                 :reps, 
#                 :weight, 
#                 :rest_time)
# end 



  

end