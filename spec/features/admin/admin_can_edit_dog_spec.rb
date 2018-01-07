require "rails_helper"

describe "When an Admin User navigates to dogs index" do
  context "the Admin can navigate to the edit page for single dog" do
    it "the Admin can edit the dog" do
      admin = create(:user, role: 1)
      category = create(:category)
      dog = create(:dog, category: category)
      dog2 = create(:dog, category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit 
    end
  end
end


As an admin
When I visit “admin/items”
And I click “Edit”
Then my current path should be “/admin/items/:ITEM_ID/edit”
And I should be able to update title, description, image, and status
