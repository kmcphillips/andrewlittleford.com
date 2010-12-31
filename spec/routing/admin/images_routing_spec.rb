require "spec_helper"

describe Admin::ImagesController do
  describe "routing" do

    it "recognizes and generates #create" do
      { :post => "/admin/images" }.should route_to(:controller => "admin/images", :action => "create")
    end

    it "recognizes and generates #create" do
      { :put => "/admin/images/1" }.should route_to(:controller => "admin/images", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/images/1" }.should route_to(:controller => "admin/images", :action => "destroy", :id => "1")
    end

    it "recognizes and generates #sort" do
      { :post => "/admin/images/sort" }.should route_to(:controller => "admin/images", :action => "sort")
    end

  end
end

