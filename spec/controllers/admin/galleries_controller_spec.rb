require 'spec_helper'

describe Admin::GalleriesController do
  before(:each) do
    login_as_mock_user
    @image = mock_model(Image)
    @gallery = mock_model(Gallery, :name => "delicious pie")
  end

  describe "GET index" do
    it "should load and assign all galleries" do
      Gallery.should_receive(:singleton).and_return(@gallery)
      get :index
      assigns(:title).should be_an_instance_of(String)
      assigns(:gallery).should == @gallery
    end
  end
end

