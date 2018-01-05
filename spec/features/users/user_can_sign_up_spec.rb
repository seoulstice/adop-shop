require 'rails_helper'

describe "a user can sign up" do
  context "a user visits the root" do
    context "a user clicks the sign up button" do
      context "a user fills out the form and signs up" do
        it "a new user account is created" do
          visit "/"

          click_on "Login"

          expect(current_path).to eq(login_path)

          click_on "Create Account"

          expect(current_path).to eq(new_user_path)

          fill_in "user[username]", with: "puppypaws"
          fill_in "user[password]", with: "donothackin"
          click_on "Create User"

          
          user = User.last

          expect(current_path).to eq(dashboard_path)
          expect(page).to have_content("Logged in as #{user.username}")
          expect(page).to_not have_link("Login")
          expect(page).to have_link("Logout")
          expect(page).to have_link("View Your Cart")

        end
      end
    end
  end
end
