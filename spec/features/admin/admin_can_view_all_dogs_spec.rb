require "rails_helper"

describe "when an admin visits the admin dashboard" do
  context "the admin sees a link to admin dogs index" do
    it "admin sees a table with all dog info" do
      admin = create(:user, role: 1)
      category = create(:category)
      dog = create(:dog, category: category)
      dog2 = create(:dog, category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_link "View All Dogs Table"


      expect(page).to have_link("#{dog.name}")
      expect(page).to have_content(dog.breed)
      expect(page).to have_content(dog.retired)
      expect(page).to have_link("Edit #{dog.name}")
      expect(page).to have_unchecked_field("dog[retired]")
      expect(page).to have_link("#{dog2.name}")
      expect(page).to have_content(dog2.breed)
      expect(page).to have_content(dog2.retired)
      expect(page).to have_link("Edit #{dog2.name}")
      expect(page).to have_unchecked_field("dog[retired]")
    end
    it "admin can edit retired status on admin dog index page" do
      admin = create(:user, role: 1)
      category = create(:category)
      dog = create(:dog, category: category)
      dog2 = create(:dog, category: category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_link "View All Dogs Table"

      page.all("input[type='checkbox']")[0].click

      page.all("input[type='submit']")[0].click

      expect(current_path).to eq(admin_dogs_path)

      expect(page).to have_link("#{dog.name}")
      expect(page).to have_content(dog.breed)
      expect(page).to have_content(dog.retired)
      expect(page).to have_link("Edit #{dog.name}")
      expect(page).to have_checked_field("dog[retired]")
      expect(page).to have_link("#{dog2.name}")
      expect(page).to have_content(dog2.breed)
      expect(page).to have_content(dog2.retired)
      expect(page).to have_link("Edit #{dog2.name}")
      expect(page).to have_unchecked_field("dog[retired]")
    end
  end
end
