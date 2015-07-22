require 'rails_helper'

feature 'User management' do
  scenario "user sign in" do

    vist root_path
      click_link 'log in'
      fill_in "email", with: "don"
      fill_in 'password', with: "don"
      click_button 'Log in'

  end
end