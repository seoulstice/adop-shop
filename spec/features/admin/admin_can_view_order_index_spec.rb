require 'rails_helper'

describe "When an Admin user visits dashboard" do
  it "the Admin can see all of the orders and their information" do
    admin = create(:user, role: 1)
    user = create(:user)
    user2 = create(:user)
    category = create(:category)
    order = create(:order, user: user, status: "Paid")
    order2 = create(:order, user: user2)
    order3 = create(:order, user: user2)
    dog = create(:dog, category: category)
    dog2 = create(:dog, category: category)
    create(:order_dog, dog: dog, order: order, quantity: 2)
    create(:order_dog, dog: dog2, order: order, quantity: 1)
    create(:order_dog, dog: dog, order: order2, quantity: 4)
    create(:order_dog, dog: dog2, order: order2, quantity: 2)
    create(:order_dog, dog: dog, order: order3, quantity: 1)
    create(:order_dog, dog: dog2, order: order3, quantity: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_link("Order #{order.id}")
    expect(page).to have_link("Order #{order2.id}")
    expect(page).to have_link("Order #{order3.id}")
    expect(page).to have_content("Paid: 1")
    expect(page).to have_content("Ordered: 2")

    click_link("Cancel", match: :first)

    expect(page).to have_content("Canceled")

    click_link("Mark as Paid", match: :first)

    expect(page).to have_content("Paid")

    click_link("Mark as Completed", match: :first)

    expect(page).to have_content("Completed")
  end
end
