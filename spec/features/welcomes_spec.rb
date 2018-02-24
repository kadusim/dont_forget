require 'rails_helper'

RSpec.feature "Welcome", type: :feature do

  before(:each) do
    visit(root_path)
  end

  context "when visit home page" do

    it 'have description message app' do
      expect(page).to have_content("Don't forget, is a todo list app to organize life")
    end

    it 'have link to Get Started' do
      expect(page).to have_link('Get Started')
    end

    it 'have link to Log in' do
      expect(page).to have_link('Log in')
    end

    it 'have link to Sign up' do
      expect(page).to have_link('Sign up')
    end

  end

  context 'when click link Get Started' do

    it 'redirect to sign in' do
      click_link 'Get Started'
      expect(page).to have_current_path(new_user_session_path)
    end

  end

  context 'when click link Log in' do

    it 'redirect to sign in' do
      click_link 'Log in'
      expect(page).to have_current_path(new_user_session_path)
    end

  end

  context 'when click link Sign up' do

    it 'redirect to sign up' do
      click_link 'Sign up'
      expect(page).to have_current_path(new_user_registration_path)
    end

  end

end
