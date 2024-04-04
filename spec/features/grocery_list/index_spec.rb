require "rails_helper"

RSpec.describe "Grocery List" do
  describe "Creating a grocery list" do
    it "Adds items to a grocery list" do
      visit "/add_item"
      
      expect(page).to have_content("Grocery List")

      fill_in :item, with: "Bananas"

      click_button "Add"

      expect(current_path).to eq("/grocery_list")
      expect(page).to have_content("Bananas")
    end

    it "Deletes an item from the list" do
      visit "/add_item"

      fill_in :item, with: "Onions"

      click_button "Add"

      expect(page).to have_content("Onions")
      expect(page).to have_button("Delete")

      click_button "Delete"

      expect(page).to_not have_content("Onions")
    end
  end
end