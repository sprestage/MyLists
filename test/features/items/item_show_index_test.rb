require "minitest_helper"

feature "Show Index of Items" do
  scenario "index of valid items is displayed" do
    visit list_items_path((items(:item01)).list)
    page.text.must_include 'Task One'
  end
end
