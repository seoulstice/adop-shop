require 'rails_helper'

describe "when a user visits the orders index" do 
  context "can navigate to order show " do
    it "sees order information for incomplete order" do 
      user = create(:user)
      category = create(:category)
      dog = create(:dog, category: category)
      order = create(:order, status: "Paid", updated_at: "2018-02-05 02:06:24 UTC", user: user)
      order_dog = create(:order_dog, dog: dog, order: order)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit orders_path 
      click_on "Order #{order.id}"

      expect(current_path).to eq(order_path(order))
      expect(page).to have_content(order.order_dogs.first.dog.name)
      expect(page).to have_content(order.order_dogs.first.quantity)
      expect(page).to have_content("Order #{order.id}")
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.created_at)
      expect(page).to_not have_content(order.updated_at)
    end 
     it "sees completed order information" do 
      user = create(:user)
      category = create(:category)
      dog = create(:dog, category: category)
      order = create(:order, status: "Completed", user: user)
      order_dog = create(:order_dog, dog: dog, order: order)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit orders_path 
      click_on "Order #{order.id}"

      expect(current_path).to eq(order_path(order))
      expect(page).to have_content(order.order_dogs.first.dog.name)
      expect(page).to have_content(order.order_dogs.first.quantity)
      expect(page).to have_content("Order #{order.id}")
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.created_at)
      expect(page).to have_content(order.updated_at)
    end   
  end
end