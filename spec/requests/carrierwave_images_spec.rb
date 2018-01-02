require 'rails_helper'

RSpec.describe "CarrierwaveImages", type: :request do
  describe "GET /carrierwave_images" do
    it "works! (now write some real specs)" do
      get carrierwave_images_path
      expect(response).to have_http_status(200)
    end
  end
end
