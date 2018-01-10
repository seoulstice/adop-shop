require 'rails_helper'

describe "a user goes to the dog show page of a retired dog" do
  context "they do not see a button to add the dog to their cart" do
    it "the user sees item retired messaging in it's place" do
      category = create(:category)
      dog = create(:dog, retired: true, category_ids: category.id)

      visit dog_path(dog.slug)
      
      expect(page).to_not have_button("Add Dog")
    end
  end
end
