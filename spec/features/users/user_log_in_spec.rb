require 'rails_helper'

feature 'User log in' do
  feature 'with log in form' do
    given!(:user) { FactoryGirl.create(:user) }

    scenario 'with valid data', js: true do
      visit root_path
      click_link('Log in')
      page.save_screenshot('/tmp/image.jpg', full: true)
      expect(page).not_to have_selector('.homepage-non-auth-user-sign-in')
    end
  end
end
