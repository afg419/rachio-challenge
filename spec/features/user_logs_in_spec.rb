require 'rails_helper'

RSpec.feature "Log In", type: :feature do
  scenario "registered user in db logs in", js: true do
    VCR.use_cassette "registered log in" do
      User.create(username: "rachiobeta", password: "test1234")
      login("rachiobeta", "test1234")

      expect(page).to have_content("Logged in as rachiobeta")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end

  scenario "logged in user refreshes still logged in", js: true do
    VCR.use_cassette "registered log in and refresh" do
      User.create(username: "rachiobeta", password: "test1234")
      login("rachiobeta", "test1234")

      visit root_path
      expect(page).to have_content("Logged in as rachiobeta")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")
    end
  end
end
