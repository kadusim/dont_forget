require 'rails_helper'

RSpec.feature "List", type: :feature do

  before(:each) do
    @new_user = FactoryBot.create(:user)
    login_as(@new_user, :scope => :user)
    visit('/')
  end

  after(:each) do
    logout(@new_user)
    Warden.test_reset!
  end

  scenario "user logged successfully" do
    expect(page).to have_content(@new_user.name)
  end

end
