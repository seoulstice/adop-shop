require 'rails_helper'

feature "when a user adds a dog to their cart" do
  before(:each) do
    @category = create(:category)
    @dog = create(:dog, category_ids: @category.id)
    
  end

  scenario "a message is displayed" do
    visit dogs_path

    click_button "Add Dog"

    expect(page).to have_content("You now have 1 #{@dog.name} in your cart")
  end

  scenario "the message correctly increments for multiple dogs" do
    visit dogs_path

    expect(page).to have_content("Cart (0)")

    click_button "Add Dog"

    expect(page).to have_content("You now have 1 #{@dog.name} in your cart")
    expect(page).to have_content("Cart (1)")
    
    click_button "Add Dog"

    expect(page).to have_content("You now have 2 #{@dog.name}s in your cart")
  end
  
end