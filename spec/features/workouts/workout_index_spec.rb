require 'rails_helper'
RSpec.describe 'Workout tests', type: :feature do 
  before :each do 
    @user_1 = User.create(username: "user1", password: "test")
    @user_2 = User.create(username: "user2", password: "test")
  end
  it 'access workout index from welcome page' do 
    visit '/'
    click_on "Login"
    fill_in :username, with: @user_1.username
    fill_in :password, with: @user_1.password
    click_on "Log In"
    
    expect(current_path).to eq("/")
    click_on "All Workouts"
    expect(current_path).to eq("/workouts")
  end 

  it "workout index page displays workouts correctly" do  
    workout_1 = Workout.create("workout_1")
    workout_2 = Workout.create("workout_2")
    workout_3 = Workout.create("workout_3")
    workout_4 = Workout.create("workout_4")
    visit '/'
    click_on "Login"
    fill_in :username, with: @user_1.username
    fill_in :password, with: @user_1.password
    click_on "Log In"
    expect(current_path).to eq("/")
    click_on "All Workouts"
    expect(current_path).to eq("/workouts")

    expect(page).to have_content("Workout_1")
    expect(page).to have_content("Workout_2")
    expect(page).to have_content("Workout_3")
    expect(page).to have_content("Workout_4")
  end 
end