require 'rails_helper'

describe "when a user visits the orders index" do 
  context "can navigate to order show " do
    it "sees order information" do 
      user = create(:user)
      category = create(:category)
      dog = create(:dog, category: category)
      order = create(:order, user: user)
      order_dog = create(:order_dog, dog: dog, order: order)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit orders_path 
      click_on "Order #{order.id}"

      expect(current_path).to eq(order_path(order))
      expect(page).to have_content(order.dogs.first.name)
      expect(page).to have_content(order.dogs.first.count)
    end  
  end
end