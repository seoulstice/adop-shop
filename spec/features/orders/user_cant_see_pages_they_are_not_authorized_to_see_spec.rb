require 'rails_helper'

describe "as a guest user" do 
  it "cannot see another users orders" do 
    user = create(:user)
    order = create(:order, user: user)

    visit order_path(order)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end