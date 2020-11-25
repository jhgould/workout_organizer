class WelcomeController < ApplicationController 

def index 
  if current_user
    @name = current_user.username
  end 
end 

end 