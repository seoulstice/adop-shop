require 'rails_helper'

describe "When an Admin User navigates to analytics dashboard" do
  it "the Admin can see User breakdown" do
    admin = create(:user, role: 1)
    user1 = create(:user)
    user2 = create(:user)
    order1 = create(:order, user: user1)
    order2 = create(:order, user: user1)
    order3 = create(:order, user: user2)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_analytics_dashboard_path

    expect(page).to have_content(user1.name)
  end

  it "the Admin user can see Category analytics" do
    admin = create(:user, role: 1)
    user1 = create(:user)
    user2 = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    dog1 = create(:dog, price: 50)
    dog2 = create(:dog, price: 100)
    dog3 = create(:dog, price: 150)
    dog4 = create(:dog, price: 100)

    category1 = create(:category, title: "Working Dog")
    category2 = create(:category, title: "Toy")
    dog_category1 = create(:dog_category, dog: dog1, category: category1)
    dog_category2 = create(:dog_category, dog: dog2, category: category1)
    dog_category3 = create(:dog_category, dog: dog3, category: category2)
    dog_category4 = create(:dog_category, dog: dog4, category: category2)

    order1 = create(:order, user: user1)
    order2 = create(:order, user: user2)

    order_dog1 = create(:order_dog, dog: dog1, order: order1)
    order_dog2 = create(:order_dog, dog: dog2, order: order2)
    order_dog3 = create(:order_dog, dog: dog3, order: order2)

    visit admin_analytics_dashboard_path

    expect(page).to have_content("Most Expensive Working Dog: #{dog2.name}")
    expect(page).to have_content("Most Expensive Toy: #{dog3.name}")

    expect(page).to have_content("Toy: 1")
    expect(page).to have_content("Working Dog: 2")
  end

  it "the Admin can see Retired Item analytics" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    dog1 = create(:dog, price: 50, retired_count: 2)
    dog2 = create(:dog, price: 100, retired_count: 1)
    dog3 = create(:dog, price: 75)

    visit admin_analytics_dashboard_path

    expect(page).to have_content("#{dog1.name}")
    expect(page).to have_content("#{dog1.retired}")
    expect(page).to have_content("2")

    expect(page).to have_content("#{dog2.name}")
    expect(page).to have_content("#{dog2.retired}")
    expect(page).to have_content("1")
  end

  it "the Admin can see order breakdown by state" do
    admin = create(:user, role: 1)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    order1 = create(:order, user: user, state: "MN", status: "Completed")
    order2 = create(:order, user: user, state: "PA", status: "Completed")
    order3 = create(:order, user: user, state: "PA", status: "Completed")
    order4 = create(:order, user: user, state: "CO", status: "Completed")
    order5 = create(:order, user: user, state: "CO", status: "Completed")
    order6 = create(:order, user: user, state: "CO", status: "Completed")

    visit admin_analytics_dashboard_path

    expect(page).to have_content("MN: 1")
    expect(page).to have_content("PA: 2")
    expect(page).to have_content("CO: 3")
  end
end
