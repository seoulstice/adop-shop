require 'rails_helper'

describe "A User visits Admin Dashboard" do
  it "when Admin, sees the admin dashboard page" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_content("Admin Dashboard")
  end

  it "when regular User, sees the admin dashboard page" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/admin/dashboard"

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  it "when Visitor, sees the admin dashboard page" do
    visit "/admin/dashboard"

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

end
