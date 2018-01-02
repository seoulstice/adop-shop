require 'rails_helper'

RSpec.describe "carrierwave_images/new", type: :view do
  before(:each) do
    assign(:carrierwave_image, CarrierwaveImage.new())
  end

  it "renders new carrierwave_image form" do
    render

    assert_select "form[action=?][method=?]", carrierwave_images_path, "post" do
    end
  end
end
