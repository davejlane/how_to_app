require "test_helper"

feature "As the user, I want to create a how to list so that I can add instructions to it." do
  scenario "adding a new list" do
    visit lists_path
    click_on "New List"
    fill_in "Name", with: lists(:one).name
    click_on "Create List"
    page.text.must_include "List has been created"
    page.text.must_include lists(:one).name
  end
end
