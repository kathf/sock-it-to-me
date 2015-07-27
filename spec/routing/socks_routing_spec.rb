require "rails_helper"

RSpec.describe SocksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/socks").to route_to("socks#index")
    end

    it "routes to #new" do
      expect(:get => "/socks/new").to route_to("socks#new")
    end

    it "routes to #show" do
      expect(:get => "/socks/1").to route_to("socks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/socks/1/edit").to route_to("socks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/socks").to route_to("socks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/socks/1").to route_to("socks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/socks/1").to route_to("socks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/socks/1").to route_to("socks#destroy", :id => "1")
    end

  end
end
