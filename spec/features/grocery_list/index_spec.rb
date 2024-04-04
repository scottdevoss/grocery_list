require "rails_helper"

RSpec.describe "Grocery List" do
  it "Creates a grocery list" do
    visit "/add_item"
    
    expect(page).to have_content("Grocery List")

    fill_in :item, with: "Bananas"
    click_button "Add"

    expect(current_path).to eq("/grocery_list")

    expect(page).to have_content("Bananas")
  end
end