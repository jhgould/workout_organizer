require 'rails_helper'
RSpec.describe 'User Profile', type: :feature do 
  before :each do 
    visit "/"
    click_on "Create User"
    fill_in :username, with: "funbucket"
    fill_in :password, with: "password"
    click_on "Create"
  end
  
  it "Pofile link is located in nav bar and brings user to profile page" do 
    within '#top-nav' do 
      expect(page).to have_link("Profile")
    end 
  end 

  it "User is redirected to form to update profile if it is not filled out" do 
    within '#top-nav' do 
      click_on "Profile"
    end 
    expect(current_path).to eq('/profile/new')
  end 

  it "User can update profile from edit page" do 
    within '#top-nav' do 
      click_on "Profile"
    end 
    
    fill_in "name", with: "Fun Bucket"
    fill_in "age", with: 26
    fill_in "height", with: 6
    fill_in "weight", with: 180
    fill_in "goal_weight", with: 160
    click_button "Submit"

    expect(current_path).to eq("/profile")
    expect(page).to have_content("Fun Bucket")
    expect(page).to have_content(26)
    expect(page).to have_content(6)
  end 

  it "user can edit prfile" do 
    within '#top-nav' do 
      click_on "Profile"
    end 
    
    fill_in "name", with: "Fun Bucket"
    fill_in "age", with: 26
    fill_in "height", with: 6
    fill_in "weight", with: 180
    fill_in "goal_weight", with: 160
    click_button "Submit"

    click_on "Edit"

    fill_in "name", with: "Bucket"
    fill_in "age", with: 56
    fill_in "height", with: 9
    fill_in "weight", with: 170
    click_button "Submit"
   
    expect(current_path).to eq("/profile")
    expect(page).to have_content("Bucket")
    expect(page).to have_content(56)
    expect(page).to have_content(160)
  end 

  it "new user is told to update profile by flash message" do 
    click_on "Log Out"
    click_on "Login"
    fill_in :username, with: "funbucket"
    fill_in :password, with: "password"
    click_on "Log In"
    new_user_message = "Welcome to the Workout Organizer! Since you are new please update your profile information."
    expect(page).to have_content(new_user_message)
  end 

  it "existing user is told welcome back 'user name' " do 
    click_on "Log Out"
    click_on "Login"
    fill_in :username, with: "funbucket"
    fill_in :password, with: "password"
    click_on "Log In"
    
    click_on "Profile"
    fill_in "name", with: "Fun Bucket"
    fill_in "age", with: 26
    fill_in "height", with: 6
    fill_in "weight", with: 180
    fill_in "goal_weight", with: 160
    click_button "Submit"
    click_on "Log Out"

    click_on "Login"
    fill_in :username, with: "funbucket"
    fill_in :password, with: "password"
    click_on "Log In"
    exsisting_user_message = "Welcome back Fun Bucket!"
    expect(page).to have_content(exsisting_user_message)

  end 

  it "user can reset password" do 
    visit "/profile"
    click_on "Submit"
    click_on "Reset Password"
    fill_in :password, with: "new_pasword"
    click_on "Submit"
    click_on "Log Out"
    visit '/login'
    fill_in :username, with: "funbucket"
    fill_in :password, with: "new_password" 
    click_on "Log In"
    expect(page).to have_content("Welcome to Workout Organizer")
  end 


end