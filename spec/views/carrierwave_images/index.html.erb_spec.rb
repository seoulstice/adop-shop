require 'rails_helper'

RSpec.describe "carrierwave_images/index", type: :view do
  before(:each) do
    assign(:carrierwave_images, [
      CarrierwaveImage.create!(),
      CarrierwaveImage.create!()
    ])
  end

  it "renders a list of carrierwave_images" do
    render
  end
end
