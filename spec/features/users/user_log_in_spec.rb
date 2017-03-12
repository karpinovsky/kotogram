require 'rails_helper'

feature 'User log in' do
  context 'click log in link at homepage' do
    scenario 'see log in form', js: true do
      visit root_path
      click_link 'Log in'
      wait_for_ajax
      expect(page).not_to have_selector('.cp-sign-up')
      expect(page).to have_selector('.cp-log-in')
    end

    context 'use log in form' do
      given!(:user) { FactoryGirl.create(:user) }
      before(:each) do
        user.confirmed_at = Time.now
        user.skip_confirmation!
        user.save
      end

      scenario 'with valid data', js: true do
        visit root_path
        click_link 'Log in'
        wait_for_ajax
        fill_in 'user[email]',    with: user.email
        fill_in 'user[password]', with: user.password
        click_on 'Log in'
        page.save_screenshot('/tmp/image.jpg', full: true)
        expect(page).not_to have_selector('.cp-log-in')
      end
    end
  end
end
