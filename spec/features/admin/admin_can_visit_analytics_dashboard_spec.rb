require 'rails_helper'

describe "When an Admin User visits admin dashboard" do
  it "the Admin can see Analytics Dashboard link and and navigate to that page" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_link("Analytics Dashboard")

    click_link("Analytics Dashboard")

    expect(current_path).to eq(admin_analytics_dashboard_path)
  end
end
