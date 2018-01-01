require 'rails_helper'

feature 'Password recovery' do

  subject { page }

  before do
    visit new_user_password_path
  end

  context 'send instructions to email' do
    given!(:user) { FactoryGirl.create(:user_with_profile) }

    it { is_expected.to have_content('Forgot your password?') }

    before do
      fill_in 'user[email]',  with: user.email
      click_button 'Send me reset instructions'
    end

    it { is_expected.to have_content('You will receive an email with instructions
      on how to reset your password in a few minutes.') }

    context 'open inbox email' do
      subject { open_email(user.email) }

      it { is_expected.to have_subject('Reset password instructions') }

      it { is_expected.to have_link('Change my password') }

      scenario 'create new password' do

        open_email(user.email)

        visit_in_email('Change my password')

        expect(page).to have_content('Change your password')
      end
    end
  end
end
