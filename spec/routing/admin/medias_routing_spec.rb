require "spec_helper"

describe Admin::MediasController do
  describe "routing" do

    it "recognizes and generates #edit" do
      { :get => "/admin/medias/1/edit" }.should route_to(:controller => "admin/medias", :action => "edit", :id => "1")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/medias/1" }.should route_to(:controller => "admin/medias", :action => "update", :id => "1")
    end

  end
end

