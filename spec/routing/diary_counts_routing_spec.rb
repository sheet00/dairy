require "rails_helper"

RSpec.describe DiaryCountsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/diary_counts").to route_to("diary_counts#index")
    end

    it "routes to #new" do
      expect(:get => "/diary_counts/new").to route_to("diary_counts#new")
    end

    it "routes to #show" do
      expect(:get => "/diary_counts/1").to route_to("diary_counts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/diary_counts/1/edit").to route_to("diary_counts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/diary_counts").to route_to("diary_counts#create")
    end

    it "routes to #update" do
      expect(:put => "/diary_counts/1").to route_to("diary_counts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/diary_counts/1").to route_to("diary_counts#destroy", :id => "1")
    end

  end
end
