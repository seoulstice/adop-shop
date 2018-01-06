require 'rails_helper'

describe "When the User navigates to Orders index" do
  it "the User can see only own orders" do
    user = create(:user)
    user2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    category = create(:category)
    dog = create(:dog, category: category)
    order = create(:order, user: user)
    order2 = create(:order, user: user2)

    visit orders_path

    expect(page).to have_link("Order #{order.id}")
    expect(page).to have_content(order.status)
    expect(page).to have_content(order.address)
    expect(page).to have_content(order.purchaser)
    expect(page).to have_content(order.created_at)

    expect(page).to_not have_link("Order #{order2.id}")
    expect(page).to_not have_content(order2.status)
    expect(page).to_not have_content(order2.address)
    expect(page).to_not have_content(order2.purchaser)
    expect(page).to_not have_content(order2.created_at)
  end

end
