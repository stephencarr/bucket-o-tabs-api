require "rails_helper"

RSpec.describe UserLinksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_links").to route_to("user_links#index")
    end

    it "routes to #new" do
      expect(:get => "/user_links/new").to route_to("user_links#new")
    end

    it "routes to #show" do
      expect(:get => "/user_links/1").to route_to("user_links#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_links/1/edit").to route_to("user_links#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_links").to route_to("user_links#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_links/1").to route_to("user_links#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_links/1").to route_to("user_links#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_links/1").to route_to("user_links#destroy", :id => "1")
    end

  end
end
