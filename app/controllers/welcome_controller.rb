class WelcomeController < ApplicationController 

def index 
  @name = current_user.username
end 

end 