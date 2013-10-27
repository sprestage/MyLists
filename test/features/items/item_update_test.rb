require "minitest_helper"

feature "Update Item" do
  scenario "item is updated" do
    # Given
    visit list_items_path((items(:item01)).list)
    page.find("tr:last").click_on "Edit"
    # When
    fill_in 'Name', with: "a shiny task"
    click_on 'Update Item'
    # Then
    page.text.must_include "Item was successfully updated"
  end
end

