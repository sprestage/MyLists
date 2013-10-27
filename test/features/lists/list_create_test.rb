require "minitest_helper"

feature "Create list" do
  scenario "adding a new list" do
    # Given
    visit lists_path
    click_on "New List"
    fill_in "List name", with: "Personal To Do List"
    # When
    click_on "Create List"
    # Then
    page.text.must_include "List was successfully created"
    page.text.must_include "Personal To Do List"
  end
end
