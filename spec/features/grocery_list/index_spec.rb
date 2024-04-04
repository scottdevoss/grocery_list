require "rails_helper"

RSpec.describe "Grocery List" do
  describe "Creating a grocery list" do
    it "Adds items to a grocery list" do
      visit "/grocery_list"
      
      expect(page).to have_content("Grocery List")

      fill_in :item, with: "Bananas"

      click_button "Add"

      expect(current_path).to eq("/grocery_list")
      expect(page).to have_content("Bananas")
    end

    it "Deletes an item from the list" do
      item1 = Item.create!(name: "Onions")

      visit "/grocery_list"

      expect(page).to have_content("Onions")

      expect(page).to have_button("Delete Onions")

      click_button "Delete Onions"
      
      expect(current_path).to eq("/grocery_list")
      
      expect(page).to_not have_content("Onions")
    end

    it "Updates an item from the list" do
      item1 = Item.create!(name: "Oranges")
      item2 = Item.create!(name: "Oreos")

      visit "/grocery_list"

      expect(page).to have_content("Oranges")

      expect(page).to have_button("Update Oranges")

      click_button "Update Oranges"

      expect(current_path).to eq("/update/1")

      fill_in :name, with: "Peaches"

      click_button "Update"

      expect(current_path).to eq("/grocery_list")

      expect(page).to have_content("Peaches")
      expect(page).to_not have_content("Oranges")
    end
  end
end