require 'rails_helper'

RSpec.feature "List", type: :feature do

  before(:each) do
    @new_user = FactoryBot.create(:user)
    login_as(@new_user, :scope => :user)
    visit(root_path)
  end

  after(:each) do
    logout(@new_user)
    Warden.test_reset!
  end

  scenario "user logged successfully" do
    expect(page).to have_content(@new_user.name)
  end

  scenario "user create a new list without name" do
    click_button "New List"
    expect(page).to have_content 'Could not created List.'
  end

  # List
  describe "when user create a list" do

    before(:each) do
      fill_in "list_name", :with => "My new list"
      click_button "New List"
    end

    scenario "user create a new list with right name" do
      expect(page).to have_content 'List was successfully created.'
    end

    scenario "user delete a list", js: true do
      click_link "Delete"
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'List was successfully deleted.'
    end

    # Task
    describe "when user create a task" do

      before(:each) do
        click_link "Add"
        find(:css, "input[id$='description']").set("My new task")
        click_button "Save"
      end

      scenario "user create a new task", js: true do
        expect(page).to have_content 'List was successfully saved.'
        expect(page).to have_content 'My new task'
      end

      scenario "user delete a task", js: true do
        click_link "Edit"
        click_link "Remove"
        expect(page).to_not have_css('.task_item')
      end

      scenario "user delete a task and save list", js: true do
        click_link "Edit"
        click_link "Remove"
        expect(page).to_not have_css('.task_item')
        click_button "Save"
        expect(page).to have_content 'List was successfully saved.'
        expect(page).to_not have_css('.task_item')
      end

    end

  end

end
