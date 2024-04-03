require "rails_helper"

RSpec.describe "Grocery List" do
  it "creates a grocery list" do
    visit "/grocery_list"
    
    expect(page).to have_content("Grocery List")
  end
end