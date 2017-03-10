require 'rails_helper'

feature 'User log in' do
  feature 'with log in form' do
    given!(:user) { FactoryGirl.create(:user) }

    scenario 'with valid data', js: true do
      visit root_path
      click_link('Log in')
      expect(page).not_to have_content('from')
    end
  end
end
