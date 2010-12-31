require "spec_helper"

describe Admin::LinksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/links" }.should route_to(:controller => "admin/links", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/links/new" }.should route_to(:controller => "admin/links", :action => "new")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/links/1/edit" }.should route_to(:controller => "admin/links", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/links" }.should route_to(:controller => "admin/links", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/links/1" }.should route_to(:controller => "admin/links", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/links/1" }.should route_to(:controller => "admin/links", :action => "destroy", :id => "1")
    end

    it "recognizes and generates #sort" do
      { :post => "/admin/links/sort" }.should route_to(:controller => "admin/links", :action => "sort")
    end

  end
end
