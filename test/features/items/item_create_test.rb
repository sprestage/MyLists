require "minitest_helper"

feature "Create Item" do
  scenario "adding a new item" do
    # Given
    visit list_items_path((items(:item01)).list)
    click_on "New Item"
    fill_in "Name", with: "Task item #1"
    # When
    click_on "Create Item"
    # Then
    page.text.must_include "Item was successfully created"
    page.has_css? "#list"
    page.text.must_include "Task item #1"
    page.text.must_include (((items(:item01)).list).list_name)
  end
end
