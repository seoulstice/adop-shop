require 'rails_helper'

describe "When an Admin User logs in" do
  it "the Admin User taken to the Admin Dashboard" do
    admin = create(:user, role: 1)

    visit '/login'

    fill_in :username, with: "#{admin.username}", exact: true
    fill_in :password, with: "#{admin.password}", exact: true
    click_button "Log In"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
  end
end
