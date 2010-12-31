require "spec_helper"

describe GalleriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/galleries" }.should route_to(:controller => "galleries", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/galleries/pie" }.should route_to(:controller => "galleries", :action => "show", :id => "pie")
    end

  end
end
