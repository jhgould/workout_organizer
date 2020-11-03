require 'rails_helper'

RSpec.describe Workout do 
  describe "Workout Model tests" do 
    describe "relationships" do 
      it {should have_many :weeks}
    end
  end 

end 