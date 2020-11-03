require 'rails_helper'

RSpec.describe Week do 
  describe "week model tests" do 
    describe "relationships" do 
      it {should belong_to :workout}
      it {should have_many :days}
    end 
  end   

end 