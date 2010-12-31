require 'spec_helper'

describe Admin::GalleriesController do
  before(:each) do
    login_as_mock_user
    @image = mock_model(Image)
    @gallery = mock_model(Gallery, :name => "delicious pie")
  end

  describe "GET index" do
    it "should load and assign all galleries" do
      Gallery.should_receive(:sorted).and_return([@gallery])
      get :index
      assigns(:galleries).should == [@gallery]
    end
  end

  describe "GET show" do
    before(:each) do
      @all_active_proxy = mock :all_active
      @all = mock :all
      Image.stub(:all_active => @all_active_proxy)
    end

    it "should set all the vars" do
      Gallery.should_receive(:find).with("pie").and_return(@gallery)
      get :show, :id => "pie"
      assigns(:title).should be_an_instance_of(String)
      assigns(:gallery).should == @gallery
    end
  end
end

