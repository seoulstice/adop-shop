require 'rails_helper'

describe "a user can sign up" do
  context "a user visits the root" do
    context "a user clicks the sign up button" do
      context "a user fills out the form and signs up" do
        it "a new user account is created" do
          visit "/"

          click_on "Sign Up"

          expect(current_path).to eq(new_user_path)

          fill_in "user[username]", with: "puppypaws"
          fill_in "user[password]", with: "donothackin"

          click_on "Create User"

          expect(current_path).to eq(dogs_path)

        end
      end
    end
  end
end
