require 'rails_helper'

feature 'Log in' do
  subject { page }

  context 'via form' do
    context 'with valid data' do
      given!(:user) { FactoryGirl.create(:user_with_profile) }

      before do
        visit new_user_session_path
        fill_in 'user[email]',    with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end

      it { is_expected.not_to have_selector('.cp-log-in-form') }
      it { is_expected.to have_content(user.profile.username) }
      it { is_expected.to have_link('Log out') }
    end

    context 'with invalid data' do
      before do
        visit new_user_session_path
        click_button 'Log in'
      end

      it { is_expected.to have_selector('.alert-danger') }
      it { is_expected.to have_selector('.cp-log-in-form') }
    end
  end
end
