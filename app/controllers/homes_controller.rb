class HomesController < ApplicationController

  before_action :is_logged_in

  def index 
    @profile = Profile.find_by(user_id: current_user.id)
  end

end 