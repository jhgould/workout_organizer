class DaysController < ApplicationController 
  def create 
    week = Week.find(params[:week_id])
    week.days.create_days(week)
    redirect_to "/weeks/#{week.id}"
  end 

  def show 
    @day = Day.find(params[:id])
  end 

 

end 