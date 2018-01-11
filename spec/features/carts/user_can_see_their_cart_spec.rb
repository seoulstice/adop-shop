require 'rails_helper'

describe "when a user navigates to the cart show page" do
  it "sees their cart contents and total" do 
    category = create(:category)
    dog = create(:dog, price: 100, category_ids: category.id)

    visit dogs_path 

    click_button "Add Dog"
    expect(current_path).to eq(dogs_path)

    click_link "Cart"
    expect(current_path).to eq(cart_path)
    expect(page).to have_content(dog.name)
    expect(page).to have_content(dog.price)
    expect(page).to have_content(dog.breed)
    expect(page).to have_content("100")
  end
end 