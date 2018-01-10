require "rails_helper"

describe "when an admin visits the order show page" do
  it "admin expects to see order information" do
    admin = create(:user, role: 1)
    user = create(:user)
    order = create(:order, user: user)
    category = create(:category)
    dog = create(:dog, category_ids: category.id)
    dog2 = create(:dog, category_ids: category.id)
    order_dog = create(:order_dog, dog: dog, order: order, quantity: 2)
    order_dog2 = create(:order_dog, dog: dog2, order: order, quantity: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit order_path(order)

    expect(page).to have_content(order.created_at)
    expect(page).to have_content(user.name)
    expect(page).to have_content(user.address)
    expect(page).to have_link("#{dog.name}")
    expect(page).to have_link("#{dog2.name}")
    expect(page).to have_content(order_dog.quantity)
    expect(page).to have_content(order_dog2.quantity)
    expect(page).to have_content(dog.price)
    expect(page).to have_content(dog2.price)
    expect(page).to have_content(dog.price * order_dog.quantity)
    expect(page).to have_content(dog2.price * order_dog2.quantity)
    expect(page).to have_content((dog.price * order_dog.quantity) + (dog2.price * order_dog2.quantity))
    expect(page).to have_content(order.status)


  end
end
