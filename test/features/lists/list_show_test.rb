require "minitest_helper"

feature "Show Single List" do
  scenario "a single valid list is displayed" do
    visit list_path(lists(:list01))
    page.text.must_include 'Shopping List'
  end
end
