require "minitest_helper"

feature "Show Single Item" do
  scenario "a single valid item is displayed" do
    visit list_items_path((items(:item01)).list)
    page.find("tr:last").click_on "Show"
    page.text.must_include 'Task Two and a half'
  end
end
