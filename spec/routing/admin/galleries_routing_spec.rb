require "spec_helper"

describe Admin::GalleriesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/admin/galleries" }.should route_to(:controller => "admin/galleries", :action => "index")
    end

  end
end

