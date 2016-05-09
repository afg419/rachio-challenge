require 'rails_helper'

RSpec.feature "User sees devices and zones", type: :feature do
  scenario "registered user sees devices when logged in", js: true do
    VCR.use_cassette "log in with devices" do
      make_test_user
      login("rachiobeta", "test1234")

      expect(page).to have_content("c761bfa0-4c49-4b4f-8a79-04e42bea881a")
      (1..8).each do |i|
        expect(page).to have_content("Zone #{i}")
      end
    end
  end
end
