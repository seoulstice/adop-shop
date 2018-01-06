require 'rails_helper'

describe "As a logged in Admin User" do
  context "the Admin can navigate to User Account edit form" do
    before(:each) do
      @admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
    end
    it "and see the form" do
      visit admin_dashboard_path

      expect(page).to have_content("Unique")

      click_link("Edit Account")

      expect(current_path).to eq(edit_user_path(@admin))
      expect(page).to have_field("user[username]")
      expect(page).to have_field("user[password]")
      expect(page).to have_field("user[address]")
      expect(page).to have_field("user[name]")
      expect(page).to have_field("user[role]")
    end
    it "they can edit account"do
      visit admin_dashboard_path

      expect(page).to have_content("Unique")

      click_link("Edit Account")

      expect(current_path).to eq(edit_user_path(@admin))
      fill_in "user[name]", with: "Unique New Name"

      click_button("Edit Account")
      expect(current_path).to eq(admin_dashboard_path)
      expect(page).to have_content("Unique New Name")
    end
  end

end
