require 'rails_helper'
RSpec.describe 'Days', type: :feature do 
  before :each do 
    @user_1 = User.create!(username: "user1", password: "test")
    @user_2 = User.create!(username: "user2", password: "test")
    @workout_1 = Workout.create!(name: "Workout 1", user: @user_1)
    @workout_2 = Workout.create!(name: "Workout 1", user: @user_2)
    @week_1 = Week.create!(name: "Week 1", workout: @workout_1)
    @week_2 = Week.create!(name: "Week 2", workout: @workout_2)
    @profile1 = Profile.create!(name: "guy", age: 23, height: 4, weight: 5, user_id: @user_1.id)
    @profile2 = Profile.create!(name: "guy1", age: 23, height: 4, weight: 5, user_id: @user_2.id)
  end
  
  it "Days display correctly" do 

    day_1 = Day.create!(name: "Day 1", week: @week_1)
    day_2 = Day.create!(name: "Day 2", week: @week_1)
    day_3 = Day.create!(name: "Day 3", week: @week_1)
    day_4 = Day.create!(name: "Day 4", week: @week_1)
    day_5 = Day.create!(name: "Day 5", week: @week_1)
    day_6 = Day.create!(name: "Day 6", week: @week_1)
    day_7 = Day.create!(name: "Day 7", week: @week_1)
    visit '/'
    click_on "Sign in"
    fill_in :username, with: @user_1.username
    fill_in :password, with: @user_1.password
    click_on "Log In"
    visit "/weeks/#{@week_1.id}"
    within "#day-#{day_1.id}" do 
      click_on "Day 1"
    end 
    expect(current_path).to eq("/days/#{day_1.id}")
    expect(page).to have_content("Day 1")
  end 

end