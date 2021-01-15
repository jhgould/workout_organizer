class DaysController < ApplicationController 

  def show 
    @day = Day.find(params[:id])
  end 

  def edit 
    @week = Week.find(params[:week_id])
  end 

  def update 
    week = Week.find(params[:week])
    Day.update_day_names(week.days, update_params)
    redirect_to "/weeks/#{week.id}"
  end 

 private 

  def update_params 
    params.permit(
      :day_1,
      :day_2,
      :day_3,
      :day_4,
      :day_5,
      :day_6,
      :day_7
    )
  end 

end 