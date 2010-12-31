require "spec_helper"

describe Admin::GalleriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/galleries" }.should route_to(:controller => "admin/galleries", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/admin/galleries/pie" }.should route_to(:controller => "admin/galleries", :action => "show", :id => "pie")
    end

  end
end

