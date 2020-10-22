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

    # expect(current_path).to eq('/users/')
    expect(page).to have_content("Welcome, test_user")
  end 

   
end