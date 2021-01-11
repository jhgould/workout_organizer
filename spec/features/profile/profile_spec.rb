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


end