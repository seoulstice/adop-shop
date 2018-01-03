require 'rails_helper'

describe 'When the Admin User navigates to dog new form' do
  context 'the Admin User can see the form' do
    it 'the Admin User can create a dog' do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_dog_path

      fill_in "dog[name]", with: "Fido"
      fill_in "dog[breed]", with: "German Shepard"
      select "Medium", from: 'dog[size]'
      fill_in "dog[weight]", with: 90
      check "dog[cat_friendly]"
      select "Male", from: 'dog[gender]'
      fill_in "dog[description]", with: "Good with cats and kids."
      fill_in "dog[price]", with: 100
      click_link_or_button 'Create Dog'

      @dog = Dog.last

      expect(current_path).to eq(dog_path(@dog))
      expect(page).to have_content("Fido")
      expect(page).to have_content("German Shepard")
      expect(page).to have_content("Medium")
      expect(page).to have_content("90")
      expect(page).to have_content("Male")
      expect(page).to have_content("Good with cats and kids.")
      expect(page).to have_content("100")
    end
  end
end
