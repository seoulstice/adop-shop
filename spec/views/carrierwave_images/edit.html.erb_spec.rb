require 'rails_helper'

RSpec.describe "carrierwave_images/edit", type: :view do
  before(:each) do
    @carrierwave_image = assign(:carrierwave_image, CarrierwaveImage.create!())
  end

  it "renders the edit carrierwave_image form" do
    render

    assert_select "form[action=?][method=?]", carrierwave_image_path(@carrierwave_image), "post" do
    end
  end
end
