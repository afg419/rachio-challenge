require 'rails_helper'

RSpec.feature "LogIn", type: :feature do
  scenario "registered user in db logs in", js: true do
    User.create(username: "rachiobeta", password: "test1234")

    visit root_path
    fill_in("username", with: "rachiobeta")
    fill_in("password", with: "test1234")
    click_on "Login"
    
    expect(page).to have_content("Logged in as rachiobeta")
    expect(page).to have_content("Logout")
    expect(page).to_not have_content("Login")
  end
end
