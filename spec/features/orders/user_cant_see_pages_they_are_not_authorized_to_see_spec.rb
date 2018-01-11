require 'rails_helper'

describe "a user visits the order show page" do 
  it "a guest user recieves a 404" do 
    user = create(:user)
    order = create(:order, user: user)

    visit order_path(order)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  it "a logged in user cannot see another users order show page" do 
    user = create(:user)
    user2 = create(:user)
    order = create(:order, user: user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user2)

    visit order_path(order)
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
  it "a guest user tries to checkout but is prompted to sign in" do 
    user = create(:user)
    order = create(:order, user: user)

    visit cart_path
 
    expect(page).to have_content("Login or Create Account to Checkout")
   
  end
end

