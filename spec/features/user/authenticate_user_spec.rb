require 'rails_helper'
RSpec.describe 'create, update, login, logout ', type: :feature do
  it "vistor can create a user" do 
    visit '/'

    click_on "Sign up"

    expect(current_path).to eq('/users/new')

    username = "test_user"
    password = "password"

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Create"

    expect(current_path).to eq('/')
  end 


  it "can log in with a existing account" do 
    user = User.create(username: "thedude69", password: "test")
    profile1 = Profile.create!(name: "guy", age: 23, height: 4, weight: 5, user_id: user.id)

    visit "/"

    click_on "Sign in"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/home')

    expect(page).to have_link("Log Out")
    expect(page).to_not have_link("Create User")
    expect(page).to_not have_link("Login")
  end 

  it "user cannot log in with bad credintials" do 
    user = User.create(username: "user", password: "test")

    visit "/"

    click_on "Sign in"

    fill_in :username, with: user.username
    fill_in :password, with: "wrong password"
    click_on "Log In"
    
    expect(current_path).to eq('/login')

    # expect(page).to have_content("Credintials are bad")

    fill_in :username, with: "wrong name"
    fill_in :password, with: "wrong password"

    click_on "Log In"

    expect(current_path).to eq('/login')

    # expect(page).to have_content("Credintials are bad")
  end 

  it "user can log out" do 
    user = User.create(username: "thedude69", password: "test")
    profile1 = Profile.create!(name: "guy", age: 23, height: 4, weight: 5, user_id: user.id)


    visit "/"

    click_on "Sign in"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/home')

    expect(page).to have_link("Log Out")
    expect(page).to_not have_link("Create User")
    expect(page).to_not have_link("Login")

    click_on "Log Out" 

    expect(current_path).to eq('/')
    expect(page).to_not have_link("Log Out")
    expect(page).to have_link("Sign up")
    expect(page).to have_link("Sign in")

  end 

  it "can log in with a existing account" do 
    user = User.create(username: "thedude69", password: "test")
    profile1 = Profile.create!(name: "guy", age: 23, height: 4, weight: 5, user_id: user.id)

    visit "/"
    within '#landing-page-username' do 
      fill_in :username, with: user.username
    end 
    within '#landing-page-password' do 
      fill_in :password, with: user.password
    end 

    click_on "Sign into Workout Organizer"
    expect(current_path).to eq('/home')

    expect(page).to have_link("Log Out")
    expect(page).to_not have_link("Sign Up")
    expect(page).to_not have_link("Sign in")
    expect(page).to_not have_link("Sign in to Workout Organizer")
  end 


   
end