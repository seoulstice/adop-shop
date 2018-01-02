require "rails_helper"

RSpec.describe CarrierwaveImagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/carrierwave_images").to route_to("carrierwave_images#index")
    end

    it "routes to #new" do
      expect(:get => "/carrierwave_images/new").to route_to("carrierwave_images#new")
    end

    it "routes to #show" do
      expect(:get => "/carrierwave_images/1").to route_to("carrierwave_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/carrierwave_images/1/edit").to route_to("carrierwave_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/carrierwave_images").to route_to("carrierwave_images#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/carrierwave_images/1").to route_to("carrierwave_images#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/carrierwave_images/1").to route_to("carrierwave_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/carrierwave_images/1").to route_to("carrierwave_images#destroy", :id => "1")
    end

  end
end
