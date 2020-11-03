require 'rails_helper'
RSpec.describe Day do 
  describe "day model tests" do 
    describe "relationships" do 
      it {should belong_to :week}
    end 
  end 
end