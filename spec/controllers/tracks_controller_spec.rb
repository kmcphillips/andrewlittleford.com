require 'spec_helper'

describe TracksController do

  def mock_track(stubs={})
    @mock_track ||= mock_model(Track, stubs).as_null_object
  end

  describe "GET show" do
    it "assigns the requested track as @track" do
      Track.stub(:find).with("37") { mock_track }
      Track.stub(:order) { [mock_track] }
      get :show, :id => "37"
      assigns(:track).should be(mock_track)
      assigns(:tracks).should == [mock_track]
    end
  end

end
