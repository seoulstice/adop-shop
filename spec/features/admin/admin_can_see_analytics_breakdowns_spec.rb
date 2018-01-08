require 'rails_helper'

describe "When an Admin User navigates to analytics dashboard" do
  it "the Admin can see User breakdown" do
    user = create(:user)
    user2 = create(:user)
    dog = create(:dog)
    dog2 = create(:dog)
    category = create(:category)
    category2 = create(:category)
    dog_category = create(:dog_category, dog: dog, category: category )
    dog_category = create(:dog_category, dog: dog2, category: category2 )
    order1 = create(:order, user: user)
    order2 = create(:order, user: user)
    order3 = create(:order, user: user2)
    create(:order_dog, dog: dog, order: order1, quantity: 2)
    create(:order_dog, dog: dog2, order: order1, quantity: 1)
    create(:order_dog, dog: dog, order: order2, quantity: 2)
    create(:order_dog, dog: dog2, order: order3, quantity: 2)

    visit admin_analytics_dashboard_path


    expect(page).to have_content(user.name)

  end



end
