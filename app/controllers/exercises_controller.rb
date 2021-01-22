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
  end 

end