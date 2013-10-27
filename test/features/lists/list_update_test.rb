require "minitest_helper"

feature "Update List" do
  scenario "list is updated" do
    # Given
    visit edit_list_path(lists(:list02))
    # When
    fill_in 'List name', with: "A Shiny List"
    click_on 'Update List'
    # Then
    page.text.must_include "List was successfully updated"
  end
end

