# encoding : utf-8
require "spec_helper"

describe BadsController do
  describe 'routing' do

    it "routes to #create" do
      post("/retrospectives/5/bads").should route_to("bads#create", :retrospective_id => "5")
    end

    it "routes to #update" do
      put("/retrospectives/1/bads/17").should route_to("bads#update", :retrospective_id => "1", :id => "17")
    end

    it "routes to #destroy" do
      delete("/retrospectives/78/bads/4").should route_to("bads#destroy", :retrospective_id => "78", :id => "4")
    end

  end
end