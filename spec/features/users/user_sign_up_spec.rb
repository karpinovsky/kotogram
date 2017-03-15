require 'rails_helper'

feature 'User sign up' do

  context 'visit homepage' do
    scenario 'see sign up form' do
      visit root_path
      expect(page).to have_selector('.cp-sign-up-form')
    end

    context 'use sign up form' do
      context 'with valid data' do
        given!(:user) { FactoryGirl.create(:user) }

        before {
          visit root_path
          fill_in 'user[email]',                    with: user.email
          fill_in 'user[name]',                     with: user.name
          fill_in 'user[username]',                 with: user.username
          fill_in 'user[password]',                 with: user.password
          fill_in 'user[password_confirmation]',    with: user.password_confirmation
          click_button 'Sign up'
        }

        context 'create an account' do
          scenario 'with chosen email' do
            expect(User.find_by(email: user.email)).not_to be_nil
          end

          scenario 'with a confirmation token' do
            expect((User.find_by(email: user.email)).confirmation_token).not_to be_nil
          end

          context 'with confirmation mail' do

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
