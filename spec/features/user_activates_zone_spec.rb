require 'rails_helper'

RSpec.feature "Zone activation", type: :feature do
  scenario "registered toggles a zone", js: true do
    VCR.use_cassette "log in with devices" do
      make_test_user
      login("rachiobeta", "test1234")

      within('.zone-1') do
        expect(page).to have_content("Run this zone?")

        fill_in "duration", with: 10
        click_on "Run this zone?"

        expect(page).to have_content("Ready to run!")
        expect(page).to_not have_content("Run this zone?")

        click_on "Ready to run!"

        expect(page).to_not have_content("Ready to run!")
        expect(page).to have_content("Run this zone?")
      end
    end
  end

  scenario "registered activates a zone", js: true do
    make_test_user
    login("rachiobeta", "test1234")

    within('.zone-1') do
      expect(page).to have_content("Seconds remaining: not currently running")
      fill_in "duration", with: 15
      click_on "Run this zone?"
    end
    #
    within('.zone-2') do
      expect(page).to have_content("Seconds remaining: not currently running")
      fill_in "duration", with: 25
      click_on "Run this zone?"
    end

    click_on "Start selected zones!"
    sleep(5)

    within('.zone-1') do
      expect(page).to have_content("Seconds remaining: 15")
      expect(page).to have_content("Run this zone?")
    end

    within('.zone-2') do
      expect(page).to have_content("Seconds remaining: 25")
      expect(page).to have_content("Run this zone?")
    end
  end
end
