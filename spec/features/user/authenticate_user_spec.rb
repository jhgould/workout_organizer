require 'rails_helper'
RSpec.describe 'create, update, login, logout ', type: :feature do
  it "vistor can create a user" do 
    visit '/'

    click_on "Create User"

    expect(current_path).to eq('/users/new')

    username = "test_user"
    password = "password"

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Create"

    expect(current_path).to eq('/')
    # expect(current_path).to eq('/users/')
    # expect(page).to have_content("Welcome, test_user")
  end 

  it "keeps user loggied in after registering" do 
    visit "/"
    click_on "Create User"
    
    username = "funbucket13"
    password = "test"

    fill_in :username, with: username
    fill_in :password, with: password    

    click_on "Create"

    visit '/profile'

    expect(page).to have_content("Welcome, #{username}")
  end 

  it "can log in with a existing account" do 
    user = User.create(username: "thedude69", password: "test")

    visit "/"

    click_on "Login"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_link("Log Out")
    expect(page).to_not have_link("Create User")
    expect(page).to_not have_link("Login")
  end 

  it "user cannot log in with bad credintials" do 
    user = User.create(username: "user", password: "test")

    visit "/"

    click_on "Login"

    fill_in :username, with: user.username
    fill_in :password, with: "wrong password"

    click_on "Log In"

    expect(current_path).to eq('/login')

    # expect(page).to have_content("Credintials are bad")

  end 

  it "user can log out" do 
    user = User.create(username: "thedude69", password: "test")

    visit "/"

    click_on "Login"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq('/')

    expect(page).to have_content("Welcome, #{user.username}")
    expect(page).to have_link("Log Out")
    expect(page).to_not have_link("Create User")
    expect(page).to_not have_link("Login")

    click_on "Log Out" 

    expect(current_path).to eq('/')
    expect(page).to_not have_link("Log Out")
    expect(page).to have_link("Create User")
    expect(page).to have_link("Login")

  end 

   
end