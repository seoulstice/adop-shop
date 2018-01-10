require "rails_helper"

describe "When an Admin User navigates to dogs index" do
  context "the Admin can navigate to the edit page for single dog" do
    it "the Admin can edit the dog" do
      admin = create(:user, role: 1)
      @category = create(:category)
      dog = create(:dog, category_ids: @category.id, weight: 100)
      dog2 = create(:dog, category_ids: @category.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dogs_path

      click_link("Edit #{dog.name}")

      expect(current_path).to eq(edit_admin_dog_path(dog.slug))
      page.should have_field("Name", with: "#{dog.name}")
      page.should have_field("Breed", with: "#{dog.breed}")
      expect(page).to have_select("dog_size", with_options: ["Small", "Medium", "Large"])
      page.should have_field("Weight", with: "#{dog.weight}")
      expect(page).to have_select("dog_gender", with_options: ["Male", "Female"])
      page.should have_field("Description", with: "#{dog.description}")
      expect(page).to have_select("dog_category_ids", with_options: ["#{@category.title}"])
      expect(page).to have_unchecked_field("dog[retired]")

      fill_in "dog[weight]", with: 200
      click_button "Edit Dog"

      expect(current_path).to eq(admin_dogs_path)

      visit dog_path(dog.slug)

      expect(page).to have_content("200")
    end
  end
end
