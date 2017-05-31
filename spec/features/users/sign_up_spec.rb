require 'rails_helper'

feature 'Sign up' do

  subject { page }

  before(:each) { visit new_user_registration_path }

  context 'via form' do
    context 'with valid data' do
      given!(:user) { FactoryGirl.build(:user_with_profile) }

      it { is_expected.to have_selector('.cp-sign-up-form') }

      before do
        fill_in 'user[email]',                          with: user.email
        fill_in 'user[profile_attributes][full_name]',  with: user.profile.full_name
        fill_in 'user[profile_attributes][username]',   with: user.profile.username
        fill_in 'user[password]',                       with: user.password
        fill_in 'user[password_confirmation]',          with: user.password_confirmation
        click_button 'Sign up'
      end


      it { is_expected.to have_selector('.alert-info') }
      it { is_expected.to have_content('A message with a confirmation link
        has been sent to your email address. Please follow the link to activate your account.') }

      context 'with confirmation email' do

        subject { open_email(user.email) }

        it { is_expected.to have_subject('Confirmation instructions') }

        it { is_expected.to have_link('Confirm my account') }

      end
    end

    context 'with invalid data' do
      before { click_button 'Sign up' }

      it { is_expected.to have_selector('.alert-danger') }
    end
  end
end
