require 'rails_helper'

describe 'user adds items to cart and visits cart show' do
  before(:each) do
    @category = create(:category)
    @dog = create(:dog, category_ids: @category.id)
  end
  it 'they can increase quantity' do
    visit dogs_path

    click_button "Add Dog"

    click_link "Cart"

    fill_in "quantity", with: 2

    click_on "Update Quantity"
    
    expect(page).to have_content(2)
  end
end
