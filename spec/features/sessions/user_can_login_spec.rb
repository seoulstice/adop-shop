require 'rails_helper'

describe "a user logs in" do
  context "a user visits the root" do
    context "a user clicks the login button" do
      context "u user fills out the form and logs in" do
        it "a user is logged in" do
          user = create(:user)

          visit "/"

          click_on "Login"

          fill_in :username, with: user.username
          fill_in :password, with: user.password

          click_on "Log In"

          expect(current_path).to eq(dashboard_path)
          expect(page).to have_content("Logged in as #{user.username}")
          expect(page).to have_link("View Your Cart")
          expect(page).to_not have_link("Login")
          expect(page).to have_link("Logout")
        end
      end
    end
  end
end
