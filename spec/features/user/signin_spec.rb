require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe 'signin' do
    let(:user) { create(:user) }

    it 'sign in successfully' do
      visit '/login'
      fill_in :user_email, with: user.email
      fill_in :user_password, with: 'password'
      click_on 'Log in'

      expect(page).not_to have_content('Log in')
    end
  end

  describe 'register' do
    it 'sign up successfully' do
      visit '/register/signup'
      fill_in :user_email, with: 'test@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Sign up'

      expect(page).not_to have_content('Sign up')
    end
  end
end
