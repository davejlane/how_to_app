require "test_helper"

feature "As the user, I want to create a step in a how to list so that I can add to a list of instructions." do
  scenario "adding a new step" do
    visit list_path(lists(:one))
    page.text.must_include lists(:one).name

    click_on "Create step"
  end
end
