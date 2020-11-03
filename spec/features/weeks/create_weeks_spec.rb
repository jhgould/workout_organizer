require 'rails_helper'
RSpec.describe 'Weeks', type: :feature do 
  before :each do 
    @user_1 = User.create(username: "user1", password: "test")
    @user_2 = User.create(username: "user2", password: "test")
    @workout_1 = Workout.create(name: "Workout_1")
    @workout_2 = Workout.create(name: "Workout_2")
  end
  it "create weeks for workout" do 
    visit '/'
    click_on "Login"
    fill_in :username, with: @user_1.username
    fill_in :password, with: @user_1.password
    click_on "Log In"
    visit "/workouts/#{@workout_1.id}"

    click_on "Add workouts by week"
    fill_in :num_weeks, with: 4
    click_on "Add Weeks"
    expect(current_path).to eq("/workouts/#{@workout_1.id}")
    expect(page).to have_content("Week 1")
    expect(page).to have_content("Week 2")
    expect(page).to have_content("Week 3")
    expect(page).to have_content("Week 4")
    
  end 

end