require "minitest_helper"

feature "Show Index of Lists" do
  scenario "index of valid Lists is displayed" do
    visit lists_path
    page.text.must_include 'Ranch Chores List'
  end
end
