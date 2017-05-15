require 'rails_helper'

feature 'User sign up' do

  context 'visit the registration page' do
    scenario 'see the sign up form' do
      visit new_user_registration_path
      expect(page).to have_selector('.cp-sign-up-form')
    end

    context 'fill out the sign up form' do
      context 'with valid data' do
        given!(:user) { FactoryGirl.create(:user_with_profile) }

        before do
          visit new_user_registration_path
          fill_in 'user[email]',                          with: user.email
          fill_in 'user[profile_attributes][full_name]',  with: user.profile.full_name
          fill_in 'user[profile_attributes][username]',   with: user.profile.username
          fill_in 'user[password]',                       with: user.password
          fill_in 'user[password_confirmation]',          with: user.password_confirmation
          click_button 'Sign up'
        end

        context 'create an account' do
          #scenario 'see the alert associated with the registration' do
          #expect(page).to have_selector('.alert-info')
          #expect(page).to have_content('A message with a confirmation link
          #has been sent to your email address.
          #Please follow the link to activate your account.')
          #end

          scenario 'with the entered email' do
            expect(User.find_by(email: user.email)).not_to be_nil
          end


          scenario 'with the confirmation token' do
            expect((User.find_by(email: user.email)).confirmation_token).not_to be_nil
          end

          context 'with the confirmation mail' do

            subject { open_email(user.email) }

            it { is_expected.to deliver_from 'karpinovsky@gmail.com' }

            it { is_expected.to deliver_to(user.email) }

            it { is_expected.to have_link('Confirm my account') }

            it { is_expected.to have_subject('Confirmation instructions') }

          end
        end
      end
    end
  end
end
