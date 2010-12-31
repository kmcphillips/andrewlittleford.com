require "spec_helper"

describe Admin::PostsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/posts" }.should route_to(:controller => "admin/posts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/admin/posts/new" }.should route_to(:controller => "admin/posts", :action => "new")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/posts/1/edit" }.should route_to(:controller => "admin/posts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/admin/posts" }.should route_to(:controller => "admin/posts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/posts/1" }.should route_to(:controller => "admin/posts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/admin/posts/1" }.should route_to(:controller => "admin/posts", :action => "destroy", :id => "1")
    end

  end
end
