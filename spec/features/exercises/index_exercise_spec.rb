require 'rails_helper'
RSpec.describe 'Exercises', type: :feature do 
  before :each do 
    @user_1 = User.create!(username: "user1", password: "test")
    @user_2 = User.create!(username: "user2", password: "test")
    @workout_1 = Workout.create!(name: "Workout 1", user: @user_1)
    @workout_2 = Workout.create!(name: "Workout 1", user: @user_2)
    @week_1 = Week.create!(name: "Week 1", workout: @workout_1)
    @week_2 = Week.create!(name: "Week 2", workout: @workout_2)
    @day_1 = Day.create!(name: "Day 1", week: @week_1)
    @day_2 = Day.create!(name: "Day 2", week: @week_1)
    @day_3 = Day.create!(name: "Day 3", week: @week_1)
    @day_4 = Day.create!(name: "Day 4", week: @week_1)
    @day_5 = Day.create!(name: "Day 5", week: @week_1)
    @day_6 = Day.create!(name: "Day 6", week: @week_1)
    @day_7 = Day.create!(name: "Day 7", week: @week_1)
  end
  
  
  it "Exercises display correctly" do 
    exercise_1 = Exercise.create!(category: "Upper Body", muscle_group: "Chest", name: "Bench Press", sets: 4, reps: 10, rest_time: 60, weight: 145, day: @day_1)
    exercise_2 = Exercise.create!(category: "Upper Body", muscle_group: "Chest", name: "Incline Bench Press", sets: 4, reps: 10, rest_time: 60, weight: 145, day: @day_1)
    exercise_2 = Exercise.create!(category: "Lower Body", muscle_group: "Legs", name: "Squats", sets: 4, reps: 10, rest_time: 60, weight: 145, day: @day_2)

    visit "/"
    click_on "Login"
    fill_in :username, with: @user_1.username
    fill_in :password, with: @user_1.password
    click_on "Log In"

    visit "/days/#{@day_1.id}"
    #create within blocks to test better
    expect(page).to have_content("Bench Press")
    expect(page).to have_content("Weight: 145")
    expect(page).to have_content("Sets: 4")
    expect(page).to have_content("Reps: 10")
    expect(page).to have_content("Rest: 60 seconds")
    expect(page).to_not have_content("Squats")
  end 

end