require 'rails_helper'

RSpec.feature "Log Out", type: :feature do
  scenario "logged in user logs out", js: true do
    login("rachiobeta", "test1234")

    click_on "Logout"

    expect(page).to_not have_content("Logged in as rachiobeta")
    expect(page).to_not have_content("Logout")
    expect(page).to have_content("Login")
  end
end
