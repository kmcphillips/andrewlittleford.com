require "spec_helper"

describe Admin::TracksController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/tracks" }.should route_to(:controller => "admin/tracks", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/tracks/new" }.should route_to(:controller => "admin/tracks", :action => "new")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/tracks/1/edit" }.should route_to(:controller => "admin/tracks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/tracks" }.should route_to(:controller => "admin/tracks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/tracks/1" }.should route_to(:controller => "admin/tracks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/tracks/1" }.should route_to(:controller => "admin/tracks", :action => "destroy", :id => "1")
    end

    it "recognizes and generates #sort" do
      { :post => "/admin/tracks/sort" }.should route_to(:controller => "admin/tracks", :action => "sort")
    end

  end
end
