require 'rails_helper'

RSpec.feature "LogIn", type: :feature do
  scenario "registered user in db logs in", js: true do
    visit root_path
    fill_in("username", with: "rachiobeta")
    fill_in("password", with: "test1234")
    click_on "Login"
    expect(page).to have_content("Logged in as rachiobeta")
  end
end
