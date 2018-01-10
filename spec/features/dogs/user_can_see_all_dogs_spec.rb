require 'rails_helper'

describe "a visitor visits dog index page" do
  it "a user can see all dogs" do
    category = create(:category)
    dog1 = create(:dog, category_ids: category.id)
    dog2 = create(:dog, category_ids: category.id)

    visit dogs_path

    expect(page).to have_content("#{dog1.name}")
    expect(page).to have_content("#{dog1.breed}")
    expect(page).to have_content("#{dog1.price}")
    expect(page).to have_content("#{dog2.name}")
    expect(page).to have_content("#{dog2.breed}")
    expect(page).to have_content("#{dog2.price}")
  end
end
