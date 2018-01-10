require 'rails_helper'

describe "as a visitor when I have items in my cart" do
  context "the user visit the cart and is forced to sign up/in to checkout" do
    it "the user clicks checkout to create their order" do
      category = create(:category)
      dog = create(:dog, category_ids: category.id)


      visit dogs_path

      click_button "Add Dog"
      expect(current_path).to eq(dogs_path)

      click_link "Cart"
      expect(current_path).to eq(cart_path)

      click_link "Login or Create Account to Checkout"
      expect(current_path).to eq(login_path)

      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit cart_path

      click_button "Checkout"
      expect(current_path).to eq(orders_path)

      expect(page).to have_content("Order was successfully placed")

      order = Order.last

      expect(page).to have_content(order.purchaser)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.address)
    end
  end
end
