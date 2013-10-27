require "minitest_helper"

feature "Delete Item" do
  scenario "item is deleted" do
    # Given
    visit list_items_path((items(:item01)).list)
    # When
    page.first(:link, "Destroy").click
    # Then
    page.text.must_include 'Task One'
    page.wont_have_content 'Task Four'
  end
end
