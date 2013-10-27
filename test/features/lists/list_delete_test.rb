require "minitest_helper"

feature "Delete List" do
  scenario "list is deleted" do
    # Given
    visit lists_path
    # When
    page.first(:link, "Destroy").click
    # Then
    page.text.must_include 'Shopping List'
    page.text.must_include 'Ranch Chores List'
    page.wont_have_content 'Boot Camp Task List'
  end
end
