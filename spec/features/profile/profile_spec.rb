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
      click_on "Profile"
    end 
    
    expect(current_path).to eq('/profile')
  end 
end