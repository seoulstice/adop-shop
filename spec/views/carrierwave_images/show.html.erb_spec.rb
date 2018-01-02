require 'rails_helper'

RSpec.describe "carrierwave_images/show", type: :view do
  before(:each) do
    @carrierwave_image = assign(:carrierwave_image, CarrierwaveImage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
