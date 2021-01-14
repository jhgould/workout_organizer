require 'rails_helper'
RSpec.describe 'Weeks', type: :feature do 
  before :each do 
    @user_1 = User.create(username: "user1", password: "test")
    @user_2 = User.create(username: "user2", password: "test")
    @profile1 = Profile.create!(name: "guy", age: 23, height: 4, weight: 5, user_id: @user_1.id)
    @profile2 = Profile.create!(name: "guy", age: 23, height: 4, weight: 5, user_id: @user_2.id)

    @workout_1 = Workout.create(name: "Workout_1", user: @user_1)
    @workout_2 = Workout.create(name: "Workout_2", user: @user_1)
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


  it "user can go to week show page" do 
    week_1 = Week.create(name: "Week 1", workout: @workout_2)
    visit '/'
    click_on "Login"
    fill_in :username, with: @user_1.username
    fill_in :password, with: @user_1.password
    click_on "Log In"
    visit "/workouts/#{@workout_2.id}"

    click_on "Week 1"
    expect(current_path).to eq("/weeks/#{week_1.id}")
    expect(page).to have_content("Week 1")
  end 

  it "user can delete weeks" do
    week_1 = Week.create(name: "Week 1", workout: @workout_2)
    week_2 = Week.create(name: "Week 2", workout: @workout_2)
    visit '/'
    click_on "Login"
    fill_in :username, with: @user_1.username
    fill_in :password, with: @user_1.password
    click_on "Log In"
    visit "/workouts/#{@workout_2.id}"

    click_on "Week 1"
    click_on "Delete Week"
    expect(current_path).to eq("/workouts/#{@workout_2.id}")
    expect(page).to_not have_content("Week 1")
  end
  
  it "when user creates a week, 7 days are created for each week" do 
    visit '/'
    click_on "Login"
    fill_in :username, with: @user_1.username
    fill_in :password, with: @user_1.password
    click_on "Log In"
    visit "/workouts/#{@workout_1.id}"

    click_on "Add workouts by week"
    fill_in :num_weeks, with: 4
    click_on "Add Weeks"
    click_on "Week 1"
    click_on "Create Days"
  

    expect(page).to have_content("Day 1")
    expect(page).to have_content("Day 2")
    expect(page).to have_content("Day 3")
    expect(page).to have_content("Day 4")
    expect(page).to have_content("Day 5")
    expect(page).to have_content("Day 6")
    expect(page).to have_content("Day 7")
  end 

end