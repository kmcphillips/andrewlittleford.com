require "spec_helper"

describe Admin::BlocksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/blocks" }.should route_to(:controller => "admin/blocks", :action => "index")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/blocks/1/edit" }.should route_to(:controller => "admin/blocks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/blocks/1" }.should route_to(:controller => "admin/blocks", :action => "update", :id => "1")
    end

  end
end
