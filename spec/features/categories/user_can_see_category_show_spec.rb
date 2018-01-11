require 'rails_helper'

describe 'When the User navigates to category show page' do
  it 'sees the dogs assigned to that category' do
    category = create(:category)
    dog1 = create(:dog, category_ids: category.id)
    dog2 = create(:dog, category_ids: category.id)

    visit category_path(category.slug)
    expect(page).to have_content(dog1.name)
    expect(page).to have_content(dog1.breed)
    expect(page).to have_content(dog1.price)

    expect(page).to have_content(dog2.name)
    expect(page).to have_content(dog2.breed)
    expect(page).to have_content(dog2.price)


  end
end
