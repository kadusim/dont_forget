require 'rails_helper'

RSpec.feature "Welcome", type: :feature do

  before(:each) do
    visit(root_path)
  end

  scenario 'User accessed home page and the main links are present' do
    expect(page).to have_content("Don't forget, is a todo list app to organize life")
    expect(page).to have_link('Get Started')
    expect(page).to have_link('Log in')
    expect(page).to have_link('Sign up')
  end

  scenario 'User clicked the Login link and the Login page was rendered' do
    click_link 'Get Started'
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'User clicked the Log in link and the Log in page was rendered' do
    click_link 'Log in'
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'User clicked the Sign up link and the Sign up page was rendered' do
    click_link 'Sign up'
    expect(page).to have_current_path(new_user_registration_path)
  end

end
